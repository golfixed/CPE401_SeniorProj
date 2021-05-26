<template>
  <div class="create-poll-page">
    <topNavi pageName="New Poll" type="cancel" />
    <div class="subpage" v-if="isLoading == false">
      <div class="content-page fullpage">
        <div class="wrapper">
          <div class="post-head-create">
            <div class="profile-pic">
              <img :src="account.image" v-if="account.image" />
              <img src="/img/default_profile.svg" v-if="!account.image" />
            </div>
            <div class="text">
              <label class="name"
                >{{ account.firstname }} {{ account.lastname }}</label
              >
            </div>
          </div>
          <textarea
            class="message"
            placeholder="Question"
            v-model="createPollInfo.question"
          >
          </textarea>
          <button class="land-btn" v-on:click="addOption()">
            <div class="icon">
              <img src="/img/icons/plus-btn.svg" />
            </div>
            <div class="text">
              <label>add option</label>
            </div>
          </button>
        </div>
        <div class="end-of-page"></div>
      </div>
      <div class="bottom-section">
        <div class="wrapper">
          <div class="btn-wrapper">
            <button
              class="sign-in"
              v-on:click="createPost()"
              v-if="allFilled == true"
            >
              <div class="single-land">
                <label>Create Poll</label>
              </div>
            </button>
            <button class="sign-in grey" v-if="allFilled == false">
              <div class="single-land">
                <label>Create Poll</label>
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
  name: "Create-Poll-Page",
  components: {
    topNavi,
    pageLoading,
    LabelFormInput,
  },
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }

    var path = this.$route.path;
    var id = path.replace("/createpost/", "");
    this.createPollInfo.class_id = parseInt(id);
  },
  data() {
    return {
      createPollInfo: {
        question: "",
        class_id: "",
        option: [],
        account_id: this.$store.state.user.profile.id,
      },
      isLoading: false,
      account: this.$store.state.user.profile,
    };
  },
  methods: {
    createPost() {
      axios.post("/createpost", this.createPostInfo).then((res) => {
        if (res.data.false != true) {
          console.log("create post sucess");
          var post_id = res.data.post_id;
          this.$router.push(
            "/classrooms/" + this.class_id + "/post/" + post_id
          );
        } else {
          alert("ERROR:" + res.data.message);
        }
      });
    },
  },
  computed: {
    allFilled: function () {
      if (
        this.createPollInfo.option == "" ||
        this.createPollInfo.option == ""
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
  padding-top: 20px;
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
textarea.message {
  padding-top: 20px;
  max-width: 100%;
}
.land-btn {
  display: grid;
  grid-template-columns: 100px auto;
  .icon {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    img {
      width: 20px;
      object-fit: contain;
    }
  }
  .text {
    height: 100%;
    display: flex;
    justify-content: flex-start;
    align-items: center;
  }
}
.post-head-create {
  width: 100%;
  display: grid;
  grid-template-columns: 44px auto 30px;
  padding-bottom: 15px;
  .profile-pic {
    width: 44px;
    height: 44px;
    border-radius: 100%;
    overflow: hidden;
    img {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }
  }
  .text {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: center;
    padding-left: 10px;
    .name {
      font-style: normal;
      font-weight: 600;
      font-size: 16px;
      line-height: 20px;
      color: #202020;
    }
  }
  .option-btn {
    width: 100%;
    height: 100%;
    display: flex;
    justify-content: flex-end;
    align-items: flex-start;
    img {
      width: 20px;
      object-fit: contain;
    }
  }
}
</style>