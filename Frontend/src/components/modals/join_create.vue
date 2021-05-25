<template>
  <transition name="mainModal">
    <div id="assist-modal" v-show="isOpen == true">
      <div class="modal-wrapper">
        <div class="box" v-if="user_role == 'std' && isJoining == false">
          <div class="modal-head">
            <label class="title">Join Classroom</label>
            <label class="desc"
              >Enter a PIN created from your class instructure. Example:
              2QRN6T</label
            >
            <!-- <label class="desc"
              >Need help? Visit our
              <router-link to="/help" class="link">FAQ section</router-link
              >.</label
            > -->
          </div>
          <div class="modal-content">
            <div>
              <input placeholder="Enter PIN" v-model="joinInfo.join_code" />
            </div>
          </div>
          <div class="modal-btn-wrapper">
            <div class="left">
              <button class="btn-dark btn-color-green" v-on:click="joinClass()">
                Join
              </button>
              <button class="btn-light" v-on:click="closeModal()">
                Cancel
              </button>
            </div>
            <div class="right"></div>
          </div>
        </div>
        <div class="box" v-if="user_role == 'tea' && isJoining == false">
          <div class="modal-head">
            <label class="title">Join Classroom</label>
            <label class="desc"
              >Enter a PIN created from your class instructure. Example:
              2QRN6T</label
            >
            <!-- <label class="desc"
              >Need help? Visit our
              <router-link to="/help" class="link">FAQ section</router-link
              >.</label
            > -->
          </div>
          <div class="modal-content">
            <div>
              <input placeholder="Enter PIN" v-model="joinInfo.join_code" />
            </div>
            <button class="btn-dark btn-color-green" v-on:click="joinClass()">
              Join
            </button>
            <div class="hr-line hr-line-white">
              <div>&nbsp;</div>
              <label>or</label>
            </div>
            <button
              class="btn-dark btn-color-green"
              v-on:click="createClassroom()"
              style="margin-top: 0 !important"
            >
              Create
            </button>
            <button class="btn-light" v-on:click="closeModal()">Cancel</button>
          </div>
        </div>
        <div class="box" v-if="isJoining == true">
          <div class="modal-content loading-box">
            <div class="loading-wrapper">
              <pageLoading label="Joining..." />
            </div>
          </div>
        </div>
      </div>
    </div>
  </transition>
</template>

<script>
import pageLoading from "@/components/page_loading.vue";
import axios from "@/axios.js";
export default {
  name: "Join-Create-Modal",
  created() {},
  components: {
    pageLoading,
  },
  data() {
    return {
      user_role: this.$store.state.user.profile.role,
      joinInfo: {
        account_id: this.$store.state.user.profile.id,
        join_code: "",
      },
      isJoining: false,
      classID: "",
    };
  },
  computed: {
    currentPage: function () {
      return this.$route.path;
    },
    isOpen: function () {
      return this.$store.state.assistModal;
    },
    user: function () {
      return this.$store.state.user.profile;
    },
  },
  methods: {
    closeModal: function () {
      this.$store.commit("Close_AllMenu");
      this.joinInfo.join_code = "";
    },
    joinClass: function () {
      if (this.joinInfo.join_code) {
        this.isJoining = true;
        axios.post("/joinclass", this.joinInfo).then((res) => {
          if (res.data.error != true) {
            this.joinInfo.join_code = "";
            this.$store.commit("Close_AllMenu");
            this.$router.push("/classrooms/" + res.data.class_id);
          } else {
            alert(res.data.message);
            this.joinInfo.join_code = "";
          }
        });
        setTimeout(
          function () {
            this.isJoining = false;
          }.bind(this),
          2000
        );
      } else alert("Please enter join PIN code.");
    },
    createClassroom: function () {
      this.$store.commit("Close_AllMenu");
      this.$router.push("/createclass");
    },
  },
};
</script>

<style lang="scss" scoped>
#assist-modal {
  position: absolute;
  width: fit-content;
  height: fit-content;
  max-width: 80vw;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 25;
  .modal-wrapper {
    width: fit-content;
    height: fit-content;

    .box {
      background: #ffffff;
      box-shadow: 0px -3px 20px 5px rgba(0, 0, 0, 0.08);
      border-radius: 22px;
      padding: 15px;
      .modal-head {
        display: flex;
        flex-direction: column;
        margin: 10px 0;
        .title {
          font-style: normal;
          font-weight: bold;
          font-size: 18px;
          line-height: 21px;
          text-align: center;
          color: #202020;
          margin-bottom: 10px !important;
        }
        .desc {
          font-style: normal;
          font-weight: normal;
          font-size: 14px;
          line-height: 20px;
          text-align: center;
          color: #8b8b8b;
          .link {
            color: #479f60;
            font-weight: 500;
            text-decoration: underline;
          }
        }
      }
    }
  }
  .modal-content {
    padding-top: 10px;
  }
  .modal-btn {
    margin-top: 20px;
    .modal-btn-wrapper {
      display: grid;
      grid-template-columns: repeat(2, 50%);
      .left {
      }
      .right {
      }
    }
  }
}
.btn-light,
.btn-dark {
  border: none;
  font-style: normal;
  font-size: 16px;
  line-height: 18px;
  text-align: center;
  // border-radius: 11px;
}
.btn-light {
  color: #8b8b8b;
  font-weight: normal;
}
.btn-dark {
  color: #fff;
  font-weight: bold;
}
.btn-color-green {
  background: #479f60;
}
.btn-color-green:active {
  background: #43965a;
}
.mainModal-enter,
.mainModal-leave-to {
  position: absolute;
  top: 100vh;
  transition: all 0.3s;
  // height: 0;
  // margin: 0;
  // padding: 0;
  // opacity: 0;
}

.mainModal-enter-active,
.mainModal-leave-active {
  top: 100vh;
  opacity: 0;
  transition: all 0.3s;
  position: absolute;
}

.mainModal-enter-to,
.mainModal-leave {
  top: 50vh;
  position: absolute;
}

button {
  margin-top: 10px;
}
input {
  margin-bottom: 15px;
}

.hr-line {
  height: 40px;
}
.loading-box {
  height: 150px;
  width: 60vw;
  max-width: 80vw;
  .loading-wrapper {
    width: 100%;
    height: 100%;
  }
}
</style>