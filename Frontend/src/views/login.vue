<template>
  <div class="welcome-page">
    <topNavi />
    <div class="content-page">
      <div class="wrapper">
        <div class="page-header">
          <h1 class="pagename">Sign In with E-mail</h1>
        </div>
        <input type="text" placeholder="E-mail" v-model="email" />
        <input type="password" placeholder="Password" v-model="password" />
        <div class="btn-wrapper">
          <button class="sign-in" v-on:click="signin">
            <router-link to="/home">
              <div class="single-land">
                <label>Sign In</label>
              </div>
            </router-link>
          </button>
        </div>
      </div>
    </div>
    <div class="bottom-sec">
      <div class="wrapper">
        <label class="bottom-label">Forget your password?</label>
        <label class="bottom-btn">Reset password</label>
      </div>
    </div>
  </div>
</template>

<script>
import topNavi from "@/components/template/topNavi.vue";
import axios from "@/axios.js";
export default {
  name: "Login-Page",
  components: {
    topNavi,
  },
  data() {
    return {
      email: "",
      password: "",
    };
  },
  methods: {
    signin: function () {
      axios
        .post("/login", {
          email: this.email,
          password: this.password,
        })
        .then(function (response) {
          console.log(response);
        })
        .catch((error) => {
          if (!error.response) {
            // network error
            this.errorStatus = "Error: Network Error";
          } else {
            this.errorStatus = error.response.data.message;
          }
        });
    },
  },
};
</script>

<style lang="scss" scoped>
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
.btn-wrapper {
  width: 100%;
  margin: 20px 0;
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