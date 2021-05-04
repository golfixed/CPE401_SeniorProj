<template>
  <div class="welcome-page">
    <topNavi />
    <div class="subpage" v-if="currentSubPage == 1">
      <div class="content-page">
        <div class="wrapper">
          <div class="page-header">
            <h1 class="pagename">Register with email</h1>
          </div>
          <input type="text" placeholder="Firstname" v-model="regis.fname" />
          <input type="text" placeholder="Lastname" v-model="regis.lname" />
          <input type="email" placeholder="E-mail" v-model="regis.email" />
          <input
            type="password"
            placeholder="Password"
            v-model="regis.password"
          />

          <div class="hr-line">
            <div>&nbsp;</div>
            <label>or</label>
          </div>
          <button>
            <router-link to="/home">
              <div class="single-land btn-fb">
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
            <label>Sign up with Google</label>
          </div>
        </button> -->
        </div>
      </div>
      <div class="bottom-section">
        <div class="wrapper">
          <div class="btn-wrapper">
            <button
              class="sign-in"
              v-on:click="signUp()"
              v-if="allFilled == true"
            >
              <div class="single-land">
                <label>Continue</label>
              </div>
            </button>
            <button class="sign-in grey" v-if="allFilled == false">
              <div class="single-land">
                <label>Continue</label>
              </div>
            </button>
          </div>
        </div>
      </div>
    </div>
    <div class="subpage" v-if="currentSubPage == 2">
      <div class="content-page">
        <div class="wrapper">
          <div class="page-header">
            <h1 class="pagename">Select your role</h1>
          </div>
          <div class="role-wrapper">
            <div class="role-item-box">
              <div class="role-item">
                <!-- <div class="role-img">
                  <img src="/img/icons/regis_teacher.svg" draggable="false" />
                </div> -->
                <div class="textbox">
                  <label class="role">Teacher</label>
                  <label class="desc"
                    >Create classrooms and announce post to all class
                    members.</label
                  >
                  <ul class="feature">
                    <li>create classroom</li>
                    <li>announce post</li>
                    <li>post file & material</li>
                  </ul>
                </div>
                <!-- <div class="tick-box">
                  <img src="/img/icons/role_tick.svg" draggable="false" />
                </div> -->
              </div>
            </div>
            <div class="role-item-box">
              <div class="role-item">
                <!-- <div class="role-img">
                  <img src="/img/icons/regis_student.svg" draggable="false" />
                </div> -->
                <div class="textbox">
                  <label class="role">Student or Teacher Assistant</label>
                  <label class="desc"
                    >Join classes and chat with everyone.</label
                  >
                  <ul class="feature">
                    <li>join classroom</li>
                    <li>discuss within classroom</li>
                    <li>chat with class members</li>
                    <li>create post & poll</li>
                  </ul>
                </div>
                <!-- <div class="tick-box">
                  <img src="/img/icons/role_tick.svg" draggable="false" />
                </div> -->
              </div>
            </div>
          </div>
          <div class="end-of-page"></div>
        </div>
        <div class="bottom-section">
          <div class="wrapper">
            <div class="role-warning">
              <label
                >Role cannot be changed after this. <br />
                <router-link to="/help" class="help-btn"
                  >Visit our FAQ</router-link
                >
                section if you need help.</label
              >
            </div>
            <div class="btn-wrapper">
              <button class="sign-in" v-if="selectedRole != ''">
                <div class="single-land">
                  <label>Continue</label>
                </div>
              </button>
              <button class="sign-in grey" v-if="selectedRole == ''">
                <div class="single-land">
                  <label>Continue</label>
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
      currentSubPage: 1,
      selectedRole: "",
    };
  },
  methods: {
    signUp: function () {
      var info = {
        firstname: this.regis.fname,
        lastname: this.regis.lname,
        email: this.regis.email,
        password: this.regis.password,
      };
      axios.post("/register", info).then(function (response) {
        console.log(response);
        if (response.status == 200) this.currentSubPage += 1;
        else alert("Registration Failed, Please try again later.");
      });
      //bypass change sub page
      this.currentSubPage = this.currentSubPage + 1;
    },
    submit: function () {
      //bypass change sub page
      this.currentSubPage = this.currentSubPage + 1;
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
.bottom-section {
  padding-top: 40px;
  background: rgb(246, 246, 246);
  background: linear-gradient(
    0deg,
    rgba(246, 246, 246, 1) 0%,
    rgba(246, 246, 246, 1) 80%,
    rgba(246, 246, 246, 0) 100%
  );
}
.end-of-page {
  height: 300px;
}
.hr-line {
  margin-top: -10px;
}
.content-page {
  background-color: #f6f6f6;
}
.btn-wrapper {
  width: 100%;
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

.wrapper {
  padding: 0 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.role-wrapper {
  width: 100%;
  .role-item-box {
    width: 100%;
    border: 1px solid;
    background-color: #fff;
    border-color: #ededed;
    border-radius: 10px;
    margin-bottom: 20px;
    // border: 1px solid #479f60;

    .role-item {
      display: block;
      padding: 20px;
      .role-img {
        width: 50px;
        height: height;
        display: flex;
        justify-content: center;
        align-items: center;
        img {
          width: 100%;
          height: 100%;
          object-fit: contain;
        }
      }
      .textbox {
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        // padding: 0 15px;

        .role,
        .desc,
        .feature {
          width: 100%;
        }
        .role {
          font-size: 18px;
          font-weight: 500;
          color: #479f60;
          border: 1px solid #479f60;
          border-width: 0 0 1px 0;
          padding-bottom: 5px !important;
          margin-bottom: 5px !important;
        }
        .desc,
        .feature {
          font-size: 14px;
          margin-top: 5px !important;
          color: #505050;
        }
        .feature {
          margin-left: 50px !important;
          line-height: 18px;
        }
      }
      .tick-box {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: flex-end;
        align-items: center;
        img {
          width: 25px;
          height: 25px;
        }
      }
    }
  }
  .role-item-box:last-child {
    margin-bottom: 0;
  }
}
.role-warning {
  width: 100%;
  font-size: 14px;
  font-weight: normal;
  text-align: center;
  line-height: 18px;
  color: #505050;
  .help-btn {
    color: #479f60;
    font-weight: 500;
    text-decoration: underline;
  }
}
</style>