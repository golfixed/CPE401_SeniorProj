<template>
  <div id="modal" v-if="isOpen == true">
    <div class="modal-wrapper">
      <div class="box">
        <div class="modal-head">
          <label class="title">Join Code</label>
          <label class="desc"
            >Invite people to this classroom by giving them this PIN
            code.</label
          >
        </div>
        <div class="modal-content">
          <div class="pin-code-box" v-on:click="doCopy()">
            <label class="pin-code-label">{{ pincode }}</label>
            <div class="copy-img">
              <img src="/img/icons/copy.svg" />
            </div>
          </div>
          <div class="copy-btn">
            <label>Tap to copy to clipboard</label>
          </div>
        </div>
        <div class="modal-btn-wrapper">
          <div class="left">
            <button class="btn-light" v-on:click="closeModal()">Cancel</button>
          </div>
          <div class="right"></div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Blank-Modal",
  created() {},
  props: {
    pincode: String,
  },
  components: {},
  data() {
    return {};
  },
  computed: {
    isOpen: function () {
      return this.$store.state.modal.PINcode;
    },
  },
  methods: {
    closeModal: function () {
      this.$store.commit("Close_AllMenu");
    },
    doCopy: function () {
      this.$copyText(this.pincode).then(
        function (e) {
          alert("Copied");
          console.log(e);
        },
        function (e) {
          alert("Can not copy");
          console.log(e);
        }
      );
    },
  },
};
</script>

<style lang="scss" scoped>
#modal {
  position: absolute;
  width: fit-content;
  height: fit-content;
  max-width: 80vw;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 21;
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
        min-width: 250px;
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
  background-color: #f6f6f6;
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
.pin-code-box {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  background: #ffffff;
  border: 1px solid #f0f0f0;
  box-sizing: border-box;
  border-radius: 10px;
  padding: 10px 30px;
  margin-bottom: 10px;
  position: relative;
  label.pin-code-label {
    font-size: 36px;
    font-weight: bold;
    text-align: center;
    color: #479f60;
  }
  .copy-img {
    width: 20px;
    height: 20px;
    margin-left: 10px;
    position: absolute;
    top: 50%;
    right: 10px;
    transform: translate(0, -50%);
    img {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }
  }
}
.copy-btn {
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  margin-bottom: 20px;
  label {
    text-align: center;
    font-style: normal;
    font-weight: normal;
    font-size: 14px;
    line-height: 16px;
    text-align: center;
    letter-spacing: -0.01em;
    color: #c9c9c9;
  }
}
</style>