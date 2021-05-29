<template>
  <transition name="slidein">
    <div id="menu-panel" v-if="isOpen == true">
      <div class="top-grey-bar"></div>
      <div
        class="wrapper-menu-item"
        v-if="this.$store.state.optionMenu.home == true"
      >
        <optionMenu
          label="Pin to favourite"
          iconURL="/img/btn/menuOption/noti.svg"
        />
      </div>
      <div
        class="wrapper-menu-item"
        v-if="this.$store.state.optionMenu.chat == true"
      >
        <optionMenu
          label="Leave this chat"
          iconURL="/img/btn/menuOption/signout.svg"
          v-on:click="leaveChat()"
        />
      </div>
      <div
        class="wrapper-menu-item"
        v-if="this.$store.state.optionMenu.classpage == true"
      >
        <div class="menu-item" v-on:click="pinClass()">
          <optionMenu
            label="Pin this Classroom"
            iconURL="/img/btn/menuOption/fav.svg"
            v-if="this.$store.state.currentClassInfo.favorite == false"
          />
          <optionMenu
            label="Unpin this classroom"
            iconURL="/img/btn/menuOption/fav.svg"
            v-if="this.$store.state.currentClassInfo.favorite == true"
          />
        </div>
        <div class="menu-item" v-on:click="leaveClass()">
          <optionMenu
            label="Leave this classroom"
            iconURL="/img/btn/menuOption/signout.svg"
          />
        </div>
      </div>
      <div
        class="wrapper-menu-item"
        v-if="this.$store.state.optionMenu.settings == true"
        v-on:click="signOut()"
      >
        <optionMenu
          label="Sign Out"
          iconURL="/img/btn/menuOption/signout.svg"
          link=""
        />
      </div>
      <div class="btn-cancel" v-on:click="closeAllMenu()">
        <label>Cancel</label>
      </div>
    </div>
  </transition>
</template>

<script>
import axios from "@/axios.js";
import optionMenu from "@/components/lists/item_option.vue";
export default {
  name: "option-menu",
  components: {
    optionMenu,
  },
  mounted() {},
  methods: {
    leaveChat: function () {
      axios.post("/");
    },
    leaveClass: function () {
      var data = {
        account_id: this.$store.state.user.profile.id,
        class_id: this.class_id,
      };
      console.log(data);
      axios.post("/leaveclass", data).then((res) => {
        if (res.data.error != true) {
          this.$router.push("/");
        } else {
          alert("ERROR: " + res.data.message);
        }
      });
    },
    closeAllMenu: function () {
      this.$store.commit("Close_AllMenu");
    },
    signOut: function () {
      localStorage.clear();
      this.$router.push({ path: "/logout" });
      console.log("Logout successfully");
    },
    pinClass() {
      console.log("pin clicked");
      axios
        .post("/pinclass", {
          account_id: this.$store.state.user.profile.id,
          class_id: this.class_id,
        })
        .then((res) => {
          console.log(res);
          if (res.data.false != true) {
            console.log("Pinned Class");
            this.$store.commit("Close_AllMenu");
            this.$router.push("/");
          }
        });
    },
  },
  computed: {
    currentPage: function () {
      var fullURL = this.$route.path;
    },
    isOpen: function () {
      return this.$store.state.optionMenuOpen;
    },
    class_id() {
      var path = this.$route.path;
      var id = path.replace("/classrooms/", "");
      return parseInt(id);
    },
  },
  data() {
    return {};
  },
};
</script>

<style lang="scss" scoped>
#menu-panel {
  width: 100vw;
  height: fit-content;
  position: absolute;
  left: 0;
  // bottom: -100%;
  bottom: 0;
  z-index: 30;
  box-shadow: 0px -3px 20px 5px rgba(0, 0, 0, 0.08);
  border-radius: 20px 20px 0px 0px;
  overflow: hidden;
  background-color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding-bottom: 40px;
  transition: all 0.3s;
  .top-grey-bar {
    height: 5px;
    width: 50px;
    background: #ededed;
    border-radius: 100px;
    margin-top: 10px;
  }
  .wrapper-menu-item {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
    .menu-item {
      width: 100%;
    }
  }
}
.slidein-enter-active {
  bottom: 0;
}
.slidein-leave-active {
  bottom: -100%;
}
.btn-cancel {
  margin-top: 40px;
  height: 50px;
  width: calc(100% - 40px);
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f6f6f6;
  border-radius: 20px;
  label {
    font-style: normal;
    font-weight: normal;
    font-size: 18px;
    line-height: 21px;
    text-align: center;
    color: #8b8b8b;
  }
}
</style>