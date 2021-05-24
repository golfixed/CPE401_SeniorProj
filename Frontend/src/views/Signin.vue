<template>
  <div class="login-page">
    <topNavi type="back" />
    <div class="content-page">
      <div class="wrapper">
        <div class="page-header">
          <h1 class="pagename">Continue with E-mail</h1>
        </div>
        <input type="text" placeholder="E-mail" v-model="email" />
        <input type="password" placeholder="Password" v-model="password" />
      </div>
    </div>
    <div class="bottom-section">
      <div class="wrapper">
        <div class="bottom-label">
          <label
            >Forgot your password?<br />
            <router-link to="/terms" class="text-btn"
              >Reset password</router-link
            ></label
          >
        </div>
        <div class="btn-wrapper">
          <button class="sign-in" v-on:click="SignIn()">
            <div class="single-land">
              <label>Log in</label>
            </div>
          </button>
        </div>
      </div>
    </div>
    <div class="loading-page" v-if="isLoading == true">
      <div class="loading-wrapper">
        <pageLoading label="Logging in, please wait..." />
      </div>
    </div>
  </div>
</template>

<script>
import topNavi from "@/components/template/top_navibar.vue";
import pageLoading from "@/components/page_loading.vue";
import axios from "@/axios.js";
export default {
  name: "Login-Page",
  components: {
    topNavi,
    pageLoading,
  },
  data() {
    return {
      email: "",
      password: "",
      isLoading: false,
      user: {},
    };
  },
  methods: {
    SignIn: function () {
      this.isLoading = true;
      setTimeout(
        function () {
          axios
            .post("/login", {
              email: this.email,
              password: this.password,
            })
            .then((res) => {
              console.log(res);
              if (res.status != 404) {
                console.log("Login: Signed In");
                localStorage.token = res.data.token;
                this.user = res.data.user;
                localStorage.setItem("user", JSON.stringify(this.user));

                window.location.reload();
              } else {
                alert("Login Failed: Incorrect email or password");
              }
            });
          this.isLoading = false;
        }.bind(this),
        2000
      );
    },
  },
};
</script>

<style lang="scss" scoped>
.content-page {
  background-color: #f6f6f6;
}
.page-header {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100px;
  h1.pagename {
    color: #505050;
    font-size: 22px;
    line-height: 26px;
  }
}
input {
  margin-bottom: 10px;
}
.sign-in {
  background-color: #479f60;
  label {
    color: #fff;
  }
}
.sign-in:active {
  background-color: #45945b;
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

.bottom-sec {
  position: fixed;
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