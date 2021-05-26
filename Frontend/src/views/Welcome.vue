<template>
  <div class="welcome-page">
    <div class="header">
      <div class="logo">
        <img src="/img/logo.png" draggable="false" />
      </div>
      <h1>Welcome to Class(i)</h1>
      <h3>An ultimate tool for the best study experience.</h3>
    </div>
    <div class="content-page-welcome">
      <div class="wrapper">
        <div class="set-top">
          <button>
            <div class="single-land">
              <div class="img-wrapper">
                <img src="/img/btn/facebook.png" />
              </div>
              <label>Continue with Facebook</label>
            </div>
          </button>
          <button>
            <div class="single-land">
              <div class="img-wrapper"><img src="/img/btn/google.png" /></div>
              <label>Continue with Google</label>
            </div>
          </button>
          <button v-on:click="login()">
            <div class="single-land">
              <div class="img-wrapper"><img src="/img/btn/email.png" /></div>
              <label>Continue with Email</label>
            </div>
          </button>
        </div>

        <!-- <h1
          style="color: green; font-size: 30px"
          v-if="this.connectServer == true"
        >
          Server is connected
        </h1>
        <h1
          style="color: red; font-size: 30px"
          v-if="this.connectServer == false"
        >
          No server connection
        </h1> -->
      </div>
      <div class="bottom-section">
        <div class="wrapper">
          <div class="hr-line">
            <div>&nbsp;</div>
            <label>or</label>
          </div>
          <div class="set-bottom-box">
            <div class="set-bottom">
              <button class="regis-btn" v-on:click="register()">
                <div class="single-land">
                  <label class="sign-up">Register</label>
                </div>
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "@/axios.js";
export default {
  name: "Welcome-Page",
  created() {
    // this.test();
  },
  data() {
    return {
      connectServer: false,
      resData: "",
    };
  },
  mounted() {
    if (localStorage.token) {
      this.$router.push({ path: "/" });
    }
  },
  methods: {
    register() {
      this.$router.push({ path: "/register" });
    },
    login() {
      this.$router.push({ path: "/login" });
    },
  },
};
</script>

<style lang="scss" scoped>
.regis-btn {
  background-color: #479f60;
  label {
    color: #fff;
  }
}
button {
  margin-bottom: 10px;
}
button:last-child {
  margin-bottom: 0;
}

.header {
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  background-color: #fff;
  border: solid;
  border-width: 0 0 1px 0;
  border-color: #ededed;
  .logo {
    width: 120px;
    height: 120px;
    transform: translate(10px, 0);
    img {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }
  }
  h1 {
    color: #202020;
    font-size: 26px;
    padding-top: 20px !important;
  }
  h3 {
    color: #8b8b8b;
    font-size: 14px;
    font-weight: 500;
    // padding-top: 5px !important;
    text-align: center;
  }
}
.content-page-welcome {
  width: 100vw;
  height: 100%;
}
.wrapper {
  padding: 0 20px;
  // height: 100%;
  display: block;

  .set-top {
    padding: 20px 0;
    width: 100%;
  }
}
.set-bottom-box {
  .set-bottom {
    width: 100%;
    display: flex;
    flex-direction: column;
    align-items: center;
    .bottom-label {
      color: #8b8b8b;
      font-size: 14px;
      padding-top: 10px !important;
      padding-bottom: 10px !important;
      border: solid;
      border-width: 1px 0 0 0;
      border-color: #ededed;
      width: 100%;
      text-align: center;
    }
    button {
      margin-bottom: 0px;
    }
  }
}
.bottom-section {
  background-color: #f6f6f6;
}
</style>