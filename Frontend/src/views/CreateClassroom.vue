<template>
  <div class="create-classroom-page">
    <topNavi type="cancel" v-if="currentSubPage == 1" />
    <div class="subpage" v-if="currentSubPage == 1 && isLoading == false">
      <div class="content-page fullpage">
        <div class="wrapper">
          <div class="page-header">
            <h1 class="pagename">Create Classroom</h1>
          </div>
          <LabelFormInput text="Class Code" />
          <input
            type="text"
            placeholder="Ex: CPE401"
            v-model="createInfo.code"
          />
          <LabelFormInput text="Class Name" />
          <input
            type="text"
            placeholder="Ex: Senior Project II"
            v-model="createInfo.name"
          />
          <LabelFormInput text="Section" />
          <input
            type="text"
            placeholder="Ex: 2 or A"
            v-model="createInfo.section"
          />
          <LabelFormInput text="Description" :optional="true" />
          <textarea
            placeholder="This class is about..."
            v-model="createInfo.desc"
          >
          </textarea>
          <LabelFormInput text="Classroom photo" :optional="true" />
          <div class="set-profile-pic">
            <div class="profile-pic">
              <div class="img">
                <img src="/img/mockup/class.png" />
              </div>
            </div>
          </div>
          <input type="file" />
        </div>
        <div class="end-of-page"></div>
      </div>
      <div class="bottom-section">
        <div class="wrapper">
          <div class="btn-wrapper">
            <button
              class="sign-in"
              v-on:click="createClass()"
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
    <div class="subpage" v-if="currentSubPage == 2 && isLoading == false">
      <div class="content-page fullpage finish-page">
        <div class="success-box">
          <div class="icon">
            <img src="/img/icons/check_green.svg" />
          </div>
          <div class="text">
            <h3>Classroom Created</h3>
            <h4>
              Classroom is successfully created.<br />PIN code to join is given
              below.
            </h4>
          </div>
          <div class="pin-code-box" v-on:click="doCopy()">
            <label class="pin-code-label">{{ classInfo.join_code }}</label>
            <div class="copy-img">
              <img src="/img/icons/copy.svg" />
            </div>
          </div>
          <label class="copy-btn">Tap to copy to clipboard</label>
        </div>
      </div>
      <div class="bottom-section bottom-section-white">
        <div class="wrapper">
          <div class="btn-wrapper">
            <button class="sign-in" v-on:click="Continue()">
              <div class="single-land">
                <label>Go To Classroom</label>
              </div>
            </button>
            <button class="close-btn" v-on:click="closePage()">
              <div class="single-land">
                <label>Close</label>
              </div>
            </button>
          </div>
        </div>
      </div>
    </div>
    <div class="subpage loading-page" v-if="isLoading == true">
      <div class="loading-wrapper">
        <pageLoading label="Creating, please wait..." />
      </div>
    </div>
  </div>
</template>

<script>
import topNavi from "@/components/template/top_navibar.vue";
import pageLoading from "@/components/page_loading.vue";
import LabelFormInput from "@/components/labels/label_form_input.vue";
import axios from "@/axios.js";

export default {
  name: "CreateClassroom-Page",
  components: {
    topNavi,
    pageLoading,
    LabelFormInput,
  },
  data() {
    return {
      createInfo: {
        code: "",
        name: "",
        section: "",
        desc: "",
      },
      isLoading: false,
      currentSubPage: 1,
      classInfo: {
        id: 3,
        join_code: "2NRWLX",
      },
    };
  },
  methods: {
    createClass: function () {
      this.isLoading = true;

      var userID = this.$store.state.user.profile.id;
      axios
        .post("/createclass", {
          class_code: this.createInfo.code,
          class_name: this.createInfo.name,
          class_desc: this.createInfo.desc,
          section: this.createInfo.section,
          create_by: userID,
        })
        .then((res) => {
          if (res.status != 404 || res.status != 500) {
            // console.log(res);
            // console.log("Create Class successfully");
            this.getClassInfo();
          } else if (res == 422) {
            // console.log("Create Failed");
          }
        });
      setTimeout(
        function () {
          this.isLoading = false;
        }.bind(this),
        2000
      );
    },
    Continue: function () {
      this.$router.push("/classrooms/" + this.classInfo.id);
    },
    joinClass: function () {
      axios
        .post("/joinclass", {
          account_id: this.$store.state.user.profile.id,
          join_code: this.classInfo.join_code,
        })
        .then((res) => {
          if (res.data.error != true) {
            // console.log("auto join class success");
          } else {
            alert(res.data.message);
          }
        });
    },
    closePage: function () {
      this.$router.push("/");
    },
    getClassInfo: function () {
      var payload = {
        class_code: this.createInfo.code,
        section: this.createInfo.section,
      };
      // console.log(payload);
      axios.post("/getclassinfo", payload).then((res) => {
        if (res.status != 404 || res.status != 500) {
          // console.log(res);
          // console.log("Get class info successfully");
          this.classInfo = res.data.classInfo;
          this.joinClass();
          // console.log(this.classInfo);
          this.currentSubPage = 2;
        } else if (res.status == 422 || res.status == 400) {
          // console.log("Get Failed");
        }
      });
    },
    doCopy: function () {
      this.$copyText(this.classInfo.join_code).then(
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
  computed: {
    allFilled: function () {
      if (
        this.createInfo.code == "" ||
        this.createInfo.section == "" ||
        this.createInfo.name == ""
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
    margin-bottom: 10px;
    z-index: 2;
    div.img {
      border-radius: 10px;
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

.loading-page {
  z-index: 20;
  position: relative;
  background-color: #fff;
  height: 100vh;
}
.bottom-section {
  padding-top: 40px;
  background: linear-gradient(
    0deg,
    rgba(246, 246, 246, 1) 0%,
    rgba(246, 246, 246, 1) 80%,
    rgba(246, 246, 246, 0) 100%
  );
}
.bottom-section-white {
  background-color: #fff;
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
  background-color: #fff;
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
input,
textarea {
  margin-bottom: 10px;
}
.sign-in {
  background-color: #479f60;
  label {
    color: #fff;
  }
}
.close-btn {
  margin-top: 10px;
  border: 0;
  label {
    color: #8b8b8b;
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
textarea {
  background-color: #fff;
  border: solid;
  border-width: 1px;
  border-color: #ededed;
  border-radius: 20px;
  outline: none;
  height: 100px;
  width: -webkit-fill-available;
  text-indent: 20px;
  font-size: 16px;
  box-shadow: none;
  border-style: solid;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
}
textarea::placeholder {
  margin-top: 20px;
}

.success-box {
  width: 100%;
  height: calc(100% - 190px);
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  .icon {
    width: 120px;
    height: 120px;
    margin-bottom: 20px;
    img {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }
  }
  .text {
    margin-bottom: 20px;
    h3 {
      font-style: normal;
      font-weight: bold;
      font-size: 22px;
      line-height: 26px;
      text-align: center;
      letter-spacing: -0.01em;
      color: #202020;
      margin-bottom: 4px !important;
    }
    h4 {
      font-style: normal;
      font-weight: normal;
      font-size: 18px;
      line-height: 21px;
      text-align: center;
      letter-spacing: -0.01em;
      color: #8b8b8b;
    }
  }

  .pin-code-box {
    width: 80%;
    display: flex;
    justify-content: center;
    align-items: center;
    background: #ffffff;
    border: 1px solid #f0f0f0;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 10px 30px;
    margin-bottom: 20px;
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
    font-style: normal;
    font-weight: normal;
    font-size: 14px;
    line-height: 16px;
    text-align: center;
    letter-spacing: -0.01em;
    color: #c9c9c9;
  }
}
btn {
  background-color: unset;
}
</style>