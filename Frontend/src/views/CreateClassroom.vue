<template>
  <div class="regis-page">
    <topNavi type="cancel" v-if="currentSubPage == 1" />
    <div class="subpage" v-if="currentSubPage == 1 && isLoading == false">
      <div class="content-page">
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
          <LabelFormInput text="Description" />
          <textarea
            placeholder="This class is about..."
            v-model="createInfo.desc"
          >
          </textarea>
        </div>
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
      <div class="content-page finish-page">
        <div class="wrapper">
          <div class="page-header">
            <h1 class="pagename">New Class Created</h1>
          </div>
        </div>
        <div class="wrapper">
          <div class="setup-sum">
            <div class="pin-box">
              <label class="pin-code">{{ classInfo.join_code }}</label>
            </div>
          </div>
        </div>
      </div>
      <div class="bottom-section">
        <div class="wrapper">
          <div class="btn-wrapper">
            <button class="sign-in" v-on:click="Continue()">
              <div class="single-land">
                <label>Continue</label>
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
      <div class="content-page">
        <div class="loading-wrapper">
          <pageLoading label="Creating, please wait..." />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import topNavi from "@/components/template/topNavi.vue";
import pageLoading from "@/components/pageLoading.vue";
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
      this.isLoading = false;
    },
    Continue: function () {
      this.$router.push("/classrooms/" + this.classInfo.id);
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
          // console.log(this.classInfo);
          this.currentSubPage = 2;
        } else if (res.status == 422 || res.status == 400) {
          // console.log("Get Failed");
        }
      });
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
  padding: 10px 0;
  background-color: #fff;
  width: 100vw;
  border: solid;
  border-width: 1px;
  border-color: #ededed;
  width: 100%;
  border-radius: 100px;
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
  z-index: 10;
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
.pin-box {
  // height: 200px;
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  .pin-code {
    font-size: 30px;
    font-weight: bold;
    text-align: center;
    color: #479f60;
  }
}
</style>