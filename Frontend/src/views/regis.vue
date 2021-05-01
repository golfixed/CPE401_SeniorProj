<template>
  <div class="welcome-page">
    <topNavi />
    <div class="content-page">
      <div class="wrapper">
        <div class="page-header">
          <h1 class="pagename">Sign up with email</h1>
        </div>
        <input type="text" placeholder="Firstname" v-model="regis.fname" />
        <input type="text" placeholder="Lastname" v-model="regis.lname" />
        <input type="email" placeholder="E-mail" v-model="regis.email" />
        <input
          type="password"
          placeholder="Password"
          v-model="regis.password"
        />
        <div class="btn-wrapper">
          <button
            class="sign-in"
            v-on:click="signUp()"
            v-if="allFilled == true"
          >
            <div class="single-land">
              <label>Sign Up</label>
            </div>
          </button>
          <button class="sign-in grey" v-if="allFilled == false">
            <div class="single-land">
              <label>Sign Up</label>
            </div>
          </button>
        </div>
        <div class="hr-line">
          <div>&nbsp;</div>
          <label>or</label>
        </div>
        <button>
          <router-link to="/home">
            <div class="single-land btn-fb">
              <div class="img-wrapper"><img src="/img/btn/facebook.png" /></div>
              <label>Sign up with Facebook</label>
            </div>
          </router-link>
        </button>
        <!-- <button>
          <div class="single-land">
            <div class="img-wrapper"><img src="/img/btn/google.png" /></div>
            <label>Sign up with Google</label>
          </div>
        </button> -->
      </div>
    </div>
    <div class="bottom-sec">
      <div class="wrapper">
        <label class="bottom-label">Already had an account?</label>
        <label class="bottom-btn">Reset password</label>
      </div>
    </div>
  </div>
</template>

<script>
import topNavi from "@/components/template/topNavi.vue";
import axios from "@/axios.js";
export default {
  name: "Register-Page",
  components: {
    topNavi,
  },
  data() {
    return {
      regis: {
        fname: "",
        lname: "",
        email: "",
        password: "",
      },
    };
  },
  methods: {
    signUp: function () {
      var body = {
        firstname: this.regis.fname,
        lastname: this.regis.lname,
        email: this.regis.email,
        password: this.regis.password,
      };
      axios.post("/register", body).then(function (response) {
        console.log(response);
      });
    },
  },
  computed: {
    allFilled: function () {
      if (
        this.regis.fname == "" ||
        this.regis.lname == "" ||
        this.regis.email == "" ||
        this.regis.password == ""
      ) {
        return false;
      } else return true;
    },
  },
};
</script>

<style lang="scss" scoped>
.btn-wrapper {
  width: 100%;
  margin: 20px 0;
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
.grey {
  background-color: #c2c2c2;
}
.grey:active {
  background-color: #b8b8b8;
}
.btn-fb {
  label {
    color: #3b5998;
  }
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