<template>
  <div class="welcome-page">
    <div class="header">
      <div class="logo">
        <img src="/img/logo.png" draggable="false" />
      </div>
      <h1>Welcome to Class(i)</h1>
      <h3>An ultimate tool for the best study experience.</h3>
    </div>
    <div class="content">
      <div class="wrapper">
        <div class="set-top">
          <button>
            <router-link to="/home">
              <div class="single-land">
                <div class="img-wrapper">
                  <img src="/img/btn/facebook.png" />
                </div>
                <label>Continue with Facebook</label>
              </div>
            </router-link>
          </button>
          <!-- <button>
            <div class="single-land">
              <div class="img-wrapper"><img src="/img/btn/google.png" /></div>
              <label>Continue with Google</label>
            </div>
          </button> -->
          <button>
            <router-link to="/login">
              <div class="single-land">
                <div class="img-wrapper"><img src="/img/btn/email.png" /></div>
                <label>Continue with Email</label>
              </div>
            </router-link>
          </button>
        </div>
        <div class="set-bottom">
          <label class="bottom-label">Don't have an account?</label>
          <button>
            <router-link to="/regis">
              <div class="single-land">
                <div><img /></div>
                <label class="sign-up">Sign Up</label>
              </div>
            </router-link>
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
    </div>
  </div>
</template>

<script>
import axios from "@/axios.js";
export default {
  name: "Welcome",
  created() {
    // this.test();
  },
  data() {
    return {
      connectServer: false,
      resData: "",
    };
  },
  methods: {
    // test: function () {
    //   axios.get("/").then((res) => {
    //     if (res.status != 404 || res.status != 500) {
    //       this.connectServer = true;
    //       // console.log(res);
    //       this.resData = res.data;
    //     }
    //   });
    // },
  },
};
</script>

<style lang="scss" scoped>
button {
  margin-bottom: 10px;
}
button:last-child {
  margin-bottom: 0;
}
.welcome-page {
  background-color: #f6f6f6;
  width: 100vw;
  height: 100vh;
  display: grid;
  grid-template-rows: 40% 60%;
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
    padding-top: 5px !important;
  }
}
.content {
  width: 100vw;
  height: 100%;
}
.wrapper {
  padding: 0 20px;
  height: 100%;
  display: flex;
  align-items: center;
  justify-content: space-between;
  flex-direction: column;

  .set-top,
  .set-bottom {
    width: 100%;
  }

  .set-top {
    padding: 20px 0;
  }
  .set-bottom {
    display: flex;
    flex-direction: column;
    align-items: center;
    padding-bottom: 20px;

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
</style>