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
        <button>
          <router-link to="/home">
            <div class="single-land">
              <div class="img-wrapper"><img src="/img/btn/facebook.png" /></div>
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
        <h1
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
        </h1>
      </div>
    </div>
    <div class="bottom-sec">
      <div class="wrapper">
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
    </div>
  </div>
</template>

<script>
import axios from "@/axios.js";
export default {
  name: "Welcome",
  created() {
    this.test();
  },
  data() {
    return {
      connectServer: false,
    };
  },
  methods: {
    test: function () {
      axios.get("/").then((res) => {
        if (res.status != 404 || res.status != 500) {
          this.connectServer = true;
        }
      });
    },
  },
};
</script>

<style lang="scss" scoped>
button {
  margin-bottom: 10px;
}
.header {
  height: 250px;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  flex-direction: column;
  padding-bottom: 20px;
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
    font-size: 24px;
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
}
.bottom-sec {
  position: absolute;
  bottom: 0;
  left: 0;
  width: 100vw;
  padding: 20px 0 30px 0;

  label.bottom-label {
    width: 100%;
    padding-top: 20px !important;
    text-align: center;
    color: #505050;
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 19px;
    margin-bottom: 10px !important;
    border: 1px solid #ededed;
    border-width: 1px 0 0 0;
  }
  label.sign-up {
    color: #479f60;
    font-weight: 700;
  }
}
.wrapper {
  padding: 0 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>