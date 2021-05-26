<template>
  <div class="regis-page">
    <topNavi type="cancel" v-if="this.currentSubPage != 4" />
    <div class="subpage" v-if="currentSubPage == 1">
      <div class="content-page fullpage">
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
            <router-link to="/">
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
          <div class="bottom-label">
            <label
              >By clicking continue, you agree to <br />our
              <router-link to="/terms" class="text-btn">Terms</router-link>,
              including our
              <router-link to="/cookie" class="text-btn"
                >Cookie Use.</router-link
              ></label
            >
          </div>
          <div class="btn-wrapper">
            <button
              class="sign-in"
              v-on:click="submitEmail()"
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
    <div class="subpage loading-page" v-if="isLoading == true">
      <div class="content-page">
        <div class="loading-wrapper">
          <pageLoading label="Registering, please wait..." />
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
            <div
              class="role-item-box"
              v-on:click="selectRole('tea')"
              v-if="selectedRole == '' || selectedRole == 'std'"
            >
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
            <div
              class="role-item-box role-item-box-selected"
              v-on:click="selectRole('tea')"
              v-if="selectedRole == 'tea'"
            >
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
            <div
              class="role-item-box"
              v-on:click="selectRole('std')"
              v-if="selectedRole == '' || selectedRole == 'tea'"
            >
              <div class="role-item">
                <!-- <div class="role-img">
                  <img src="/img/icons/regis_student.svg" draggable="false" />
                </div> -->
                <div class="textbox">
                  <label class="role">Student</label>
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
            <div
              class="role-item-box role-item-box-selected"
              v-on:click="selectRole('std')"
              v-if="selectedRole == 'std'"
            >
              <div class="role-item">
                <!-- <div class="role-img">
                  <img src="/img/icons/regis_student.svg" draggable="false" />
                </div> -->
                <div class="textbox">
                  <label class="role">Student</label>
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
            <div class="bottom-label">
              <label
                >Role cannot be changed after this. <br />
                <router-link to="/help" class="text-btn"
                  >Visit our FAQ</router-link
                >
                section if you need help.</label
              >
            </div>
            <div class="btn-wrapper">
              <button
                class="sign-in"
                v-if="selectedRole != ''"
                v-on:click="submitRole()"
              >
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
    <div class="subpage" v-if="currentSubPage == 3">
      <div class="content-page">
        <div class="wrapper">
          <div class="page-header">
            <h1 class="pagename">Set profile photo</h1>
          </div>
        </div>
        <div class="wrapper">
          <div class="set-profile-pic">
            <div class="profile-pic">
              <div class="img">
                <img src="/img/icons/regis_profile.svg" />
              </div>
            </div>
          </div>
          <input type="file" />
        </div>
      </div>
      <div class="bottom-section">
        <div class="wrapper">
          <div class="btn-wrapper">
            <div class="bottom-label">
              <label
                >You can change profile photo later in settings page.<br />
                <router-link to="/help" class="text-btn"
                  >Visit our FAQ</router-link
                >
                section if you need help.</label
              >
            </div>
            <button class="sign-in" v-on:click="nextPage()">
              <div class="single-land">
                <label>Continue</label>
              </div>
            </button>
          </div>
        </div>
      </div>
    </div>
    <div class="subpage" v-if="currentSubPage == 4">
      <div class="content-page finish-page">
        <div class="wrapper">
          <div class="page-header">
            <h1 class="pagename">You're all set!</h1>
          </div>
        </div>
        <div class="wrapper">
          <div class="setup-sum">
            <div class="profile-pic">
              <div class="img">
                <img src="/img/icons/regis_profile.svg" />
              </div>
            </div>
            <h1 class="pagename">{{ regis.fname }} {{ regis.lname }}</h1>
            <label class="role" v-if="selectedRole == 'std'">Student</label>
            <label class="role" v-if="selectedRole == 'tea'">Lecturer</label>
            <label class="email">{{ regis.email }}</label>
          </div>
        </div>
      </div>
      <div class="bottom-section">
        <div class="wrapper">
          <div class="btn-wrapper">
            <button class="sign-in" v-on:click="completeSetup()">
              <div class="single-land">
                <label>Finish Setup</label>
              </div>
            </button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import topNavi from "@/components/template/top_navibar.vue";
import pageLoading from "@/components/page_loading.vue";
import axios from "@/axios.js";

export default {
  name: "Register-Page",
  components: {
    topNavi,
    pageLoading,
  },
  data() {
    return {
      regis: {
        fname: "",
        lname: "",
        email: "",
        password: "",
      },
      user: {},
      currentSubPage: 1,
      selectedRole: "",
      isLoading: false,
    };
  },
  methods: {
    completeSetup: function () {
      window.location.reload();
    },
    nextPage: function () {
      this.currentSubPage = this.currentSubPage + 1;
    },
    SignIn: function () {
      this.isLoading = true;
      var loginInfo = {
        email: this.regis.email,
        password: this.regis.password,
      };
      axios.post("/login", loginInfo).then((res) => {
        if (res.false != true) {
          console.log("Regis: Logged In");
          localStorage.token = res.data.token;
          this.user = res.data.user;
        } else {
          alert("Regis: Login Failed");
        }
      });
      this.isLoading = false;
    },
    submitEmail: function () {
      this.isLoading = true;
      var regisInfo = {
        firstname: this.regis.fname,
        lastname: this.regis.lname,
        email: this.regis.email,
        password: this.regis.password,
      };
      axios.post("/register", regisInfo).then((res) => {
        console.log(res);
        if (res.false != true) {
          console.log("Regis: Email valid");
          this.SignIn();
          this.nextPage();
        } else {
          console.log("Regis: Email error");
          alert("Error: ");
        }
      });

      setTimeout(
        function () {
          this.isLoading = false;
        }.bind(this),
        2000
      );
    },
    submitRole: function () {
      this.isLoading = true;
      axios
        .post("/addrole", {
          id: this.user.id,
          role: this.selectedRole,
        })
        .then((res) => {
          if (res.false != true) {
            console.log("update role completed");
            this.user.role = this.selectedRole;
            localStorage.setItem("user", JSON.stringify(this.user));
          } else {
            console.log("update role fail");
            alert("Error: ");
          }
        });
      //bypass change sub page

      setTimeout(
        function () {
          this.isLoading = false;
        }.bind(this),
        2000
      );

      this.nextPage();
    },
    selectRole: function (role) {
      if (this.selectedRole == "") {
        this.selectedRole = role;
        // console.log("brand new");
      } else if (this.selectedRole == role) {
        // console.log("same");
        this.selectedRole = "";
      } else {
        // console.log("dup");
        this.selectedRole = role;
      }
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
.set-profile-pic {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding: 20px 0;

  width: 100vw;
  div.profile-pic {
    width: 120px;
    height: 120px;
    position: relative;
    margin-bottom: 20px;
    z-index: 2;
    div.img {
      border-radius: 100%;
      overflow: hidden;
      width: 120px;
      height: 120px;
      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
    }
    div.add {
      background: #505050;
      width: 30px;
      height: 30px;
      display: flex;
      justify-content: center;
      align-items: center;
      position: absolute;
      bottom: 0;
      right: 0;
      border-radius: 100%;
      div.img-edit {
        width: 13px;
        height: 13px;
        img {
          width: 100%;
          height: 100%;
          object-fit: contain;
        }
      }
    }
  }
}
.setup-sum {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding: 20px 0;
  background-color: #fff;
  width: 100vw;
  border: solid;
  border-width: 1px;
  border-color: #ededed;
  width: 100%;
  border-radius: 10px;
  div.profile-pic {
    width: 120px;
    height: 120px;
    position: relative;
    margin-bottom: 20px;
    z-index: 2;
    div.img {
      border-radius: 100%;
      overflow: hidden;
      width: 120px;
      height: 120px;
      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
    }
    div.edit {
      background: linear-gradient(139.07deg, #3c6697 20.27%, #1e9f13 99.96%);
      width: 30px;
      height: 30px;
      display: flex;
      justify-content: center;
      align-items: center;
      position: absolute;
      bottom: 0;
      right: 0;
      border-radius: 100%;
      div.img-edit {
        width: 13px;
        height: 13px;
        img {
          width: 100%;
          height: 100%;
          object-fit: contain;
        }
      }
    }
  }
  h1.names {
    color: #202020;
    font-size: 24px;
    line-height: 26px;
  }
  label.email,
  label.role {
    color: #8b8b8b;
    font-size: 16px;
    padding-top: 5px !important;
  }
}
.loading-page {
  z-index: 20;
  position: relative;
}
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

.hr-line {
  margin-top: -10px;
}
.content-page {
  background-color: #f6f6f6;
}
.finish-page {
  padding-top: 61px;
  margin-top: 0;
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
          font-weight: 600;
          color: #479f60;
          // border: 1px solid #479f60;
          // border-width: 0 0 1px 0;
          // padding-bottom: 5px !important;
          // margin-bottom: 5px !important;
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
  .role-item-box-selected {
    border: 1px solid #479f60;
  }
}
</style>