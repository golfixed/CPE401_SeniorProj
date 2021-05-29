<template>
  <div id="page-setting" class="fullpage">
    <topNavi
      type="back"
      :chathead="true"
      :menu="true"
      :chatInfo="chatInfo"
      optionName="chat"
    />
    <div class="content-page app-default-border-gray" id="display-port">
      <div class="message-wrapper">
        <label for="">debug: sender ID= {{ senderID }}</label>
        <div
          class="chat-bubble-item"
          v-for="item in messageList"
          :key="item.id"
        >
          <div class="chat-bubble left" v-if="item.create_by != senderID">
            <div class="receiver">
              <label class="timestamp">10:30</label>
              <label for="">
                {{ item.content }}
              </label>
            </div>
            <div></div>
          </div>
          <div class="chat-bubble right" v-if="item.create_by == senderID">
            <div></div>
            <div class="sender">
              <label class="timestamp">10:30</label>
              <label for="">
                {{ item.content }}
              </label>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="chat-sender-wrapper">
      <div class="chat-sender">
        <div class="add-img-btn">
          <img src="/img/icons/add-img.svg" />
        </div>
        <input type="text" placeholder="comment" />
        <div class="enter-btn" v-on:click="sendMessage()">
          <img src="/img/icons/arrow-up.svg" />
        </div>
      </div>
    </div>
    <div
      class="modal-overlay"
      v-if="isOverlayOpen == true"
      v-on:click="closePINcode()"
    ></div>
  </div>
</template>

<script>
import topNavi from "@/components/template/top_navibar.vue";
import axios from "@/axios.js";

export default {
  name: "ClassPage-Page",
  components: {
    topNavi,
  },
  data() {
    return {
      isLoading: false,
      isOverlayOpen: false,
      senderID: this.$store.state.user.profile.id,
      chatInfo: {
        chat_id: 1,
        profile_pic: "/img/mockup/profile_volk.png",
        firstname: "Bhaksiree",
        lastname: "Tongtago",
      },
      sendMessageText: {
        text: "",
      },
      messageList: [
        {
          id: 1,
          create_by: 1,
          receiver_pic: "/img/mockup/profile_volk.png",
          content: "Hey!",
        },
        {
          id: 2,
          create_by: 2,
          receiver_pic: "/img/mockup/profile_volk.png",
          content: "This is a test message na ka",
        },
        {
          id: 3,
          create_by: 1,
          receiver_pic: "/img/mockup/profile_volk.png",
          content: "OK Kha",
        },
        {
          id: 4,
          create_by: 1,
          receiver_pic: "/img/mockup/profile_volk.png",
          content:
            "Praesent lobortis fermentum mi, rhoncus facilisis augue euismod ac. Etiam auctor libero ut dui feugiat imperdiet. Nullam nec massa id lorem malesuada fringilla mattis ac nunc. Aenean non ante ipsum. Integer at pretium sem. Phasellus dolor nisl dolor.",
        },
        {
          id: 5,
          create_by: 2,
          receiver_pic: "/img/mockup/profile_volk.png",
          content:
            "Nulla at pharetra orci. Integer sit amet mi facilisis, pharetra libero non, rutrum ligula. ",
        },
        {
          id: 6,
          create_by: 1,
          receiver_pic: "/img/mockup/profile_volk.png",
          content: "Okiyoki",
        },
        {
          id: 7,
          create_by: 2,
          receiver_pic: "/img/mockup/profile_volk.png",
          content: "Okiyoki",
        },
        {
          id: 8,
          create_by: 2,
          receiver_pic: "/img/mockup/profile_volk.png",
          content:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Eget",
        },
      ],
    };
  },
  computed: {},
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }
    var path = this.$route.path;
    var chai_id = path.replace("/chat/", "");

    // console.log("Current class id:" + class_id);
    this.fetchChatInfo();
    this.fetchMessage();
    this.scrollToBottom();
  },
  methods: {
    changeTab(tab) {
      window.scrollTo(0, 0);
      this.currentTab = tab;
    },
    fetchChatInfo() {
      console.log("CHATROOM: Fetch Info");
    },
    fetchMessage() {
      console.log("CHATROOM: Fetch Messages");
    },
    sendMessage() {},
    scrollToBottom: function (id) {
      var div = document.getElementById("display-port");
      div.scrollTop = div.scrollHeight - div.clientHeight;
    },
  },
};
</script>

<style lang="scss" scoped>
.wrapper {
  padding: 0 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
#page-setting {
  background-color: #f6f6f6;
}
.class-img {
  height: 150px;
  width: 100%;
  // border-radius: 10px;
  overflow: hidden;
  img {
    width: 100%;
    height: 100%;
    object-fit: cover;
  }
}
.class-info {
  background-color: #fff;
  border: 1px solid #ededed;
  border-width: 0 0 1px 0;
  padding: 20px;
  padding-bottom: 15px;
  .info {
    // display: grid;
    // grid-template-columns: 70px auto;
    display: flex;
    flex-direction: column;
    .text {
      width: 100%;
      display: grid;
      grid-template-columns: auto 60px;

      .left {
        width: -webkit-fill-available;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        flex-direction: column;
        padding-right: 15px;
        .code {
          background: linear-gradient(135deg, #3c6697 0%, #3b9b50 100%);
          -webkit-background-clip: text;
          -webkit-text-fill-color: transparent;
          font-style: normal;
          font-weight: 600;
          font-size: 20px;
          line-height: 24px;
          margin-bottom: 6px !important;
        }
        .title {
          font-style: normal;
          font-weight: 600;
          font-size: 20px;
          line-height: 24px;
          color: #505050;
          margin-bottom: 6px !important;
        }
        .section {
          font-style: normal;
          font-weight: normal;
          font-size: 18px;
          line-height: 19px;
          color: #8b8b8b;
          // margin-bottom: 2px !important;
        }
      }
      .right {
        display: flex;
        justify-content: center;
        align-items: center;
        .pincode-btn {
          display: flex;
          justify-content: center;
          align-items: center;
          flex-direction: column;
          .code-icon {
            width: 26px;
            height: 26px;
            margin-bottom: 5px;
            img {
              width: 100%;
              height: 100%;
              object-fit: contain;
            }
          }
          label {
            font-style: normal;
            font-weight: normal;
            font-size: 14px;
            text-align: center;
            color: #8b8b8b;
          }
        }
      }
    }
  }
  .member {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 25px;
    .img-box {
      display: flex;
      justify-content: flex-end;
      align-items: center;
      flex-direction: row-reverse;
      padding-left: 10px;
      .member-item {
        width: 34px;
        height: 34px;
        overflow: hidden;
        border-radius: 100%;
        margin-left: -10px;
        img {
          width: 100%;
          height: 100%;
          object-fit: contain;
        }
        .more-num {
          width: 100%;
          height: 100%;
          background: #ededed;
          display: flex;
          justify-content: center;
          align-items: center;
          font-style: normal;
          font-weight: normal;
          font-size: 14px;
          line-height: 16px;
          text-align: center;
          color: #c9c9c9;
        }
      }
    }
    .all-member-btn {
      display: flex;
      justify-content: center;
      align-items: flex-end;
      .text {
        font-style: normal;
        font-weight: normal;
        font-size: 14px;
        line-height: 16px;
        text-align: right;
        color: #c9c9c9;
        margin-right: 10px;
      }
      .icon {
        width: 15px;
        height: 15px;
        img {
          width: 100%;
          height: 100%;
          object-fit: contain;
        }
      }
    }
  }
  .tabs-wrapper {
    // border: 1px solid #ededed;
    // border-width: 1px 0 0 0;
    width: 100%;
    padding-top: 15px;
    // margin-top: 15px;
    .tabs {
      display: flex;
      margin: 0 -20px;
      display: flex;
      flex-wrap: nowrap;
      overflow-x: auto;

      .tab-item {
        flex: 0 0 auto;
        width: fit-content;
        justify-content: center;
        align-items: center;
        margin-right: 10px;
        .tab-item-box {
          display: flex;
          justify-content: center;
          align-items: center;
          width: fit-content;
          padding: 0 20px;
          margin: 0;
          height: 40px;
          border-radius: 100px;
          background: #f6f6f6;
          label {
            font-style: normal;
            font-weight: normal;
            font-size: 16px;
            line-height: 19px;
            text-align: center;
            color: #505050;
          }
        }
        .active {
          background: #479f60;
          border-radius: 100px;
          label {
            color: #fff;
          }
        }
      }
      .tab-item:first-child {
        margin-left: 20px;
      }
      .tab-item:last-child {
        margin-right: 20px;
        padding-right: 20px;
      }
    }
    .tabs::-webkit-scrollbar {
      display: none;
    }
  }
}
.assist-btn-wrapper {
  bottom: 120px;
}
.pin-modal {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  z-index: 25;
}
.modal-overlay {
  background-color: #0000003b;
  width: 100vw;
  height: 100vh;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 20;
}
.bottom-section {
  padding-top: 0;
}
.chat-sender-wrapper {
  width: 100vw;
  position: fixed;
  bottom: 0;
  left: 0;
  padding: 15px 0px;
  background-color: #fff;
  border: 1px solid #ededed;
  .chat-sender {
    padding: 0px 20px;
    display: grid;
    grid-gap: 10px;
    grid-template-columns: 44px auto 44px;
    .enter-btn,
    .add-img-btn {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 44px;
      width: 44px;
      border-radius: 100px;
      overflow: hidden;
      img {
        height: 20px;
        object-fit: contain;
      }
    }
    .enter-btn {
      background: linear-gradient(139.07deg, #3c6697 20.27%, #1e9f13 99.96%);
    }
    input {
      margin-bottom: 0;
    }
    .btn-wrapper {
      width: 100%;
      margin: 20px 0;
    }
  }
}
.message-wrapper {
  padding: 20px;
  padding-bottom: 100px;
  .chat-bubble-item {
    margin-bottom: 15px;
    width: 100%;
    display: flex;
    .chat-bubble {
      width: 100%;
      font-style: normal;
      font-weight: normal;
      font-size: 16px;
      line-height: 19px;
      letter-spacing: -0.01em;
    }

    .receiver {
      padding: 15px;
      color: #202020;
      background-color: #ededed;
      border-radius: 0 20px 20px 20px;
      justify-self: flex-start;
      display: flex;
      justify-content: flex-start;
      flex-direction: column;
      max-width: 60%;
      min-width: fit-content;
      label {
        width: 100%;
        text-align: left;
      }
    }
    .sender {
      padding: 15px;
      color: #fff;
      background: linear-gradient(158.18deg, #3c6697 18.21%, #3b9b50 103.89%);
      border-radius: 20px 20px 0 20px;
      justify-self: flex-end;
      display: flex;
      justify-content: flex-end;
      flex-direction: column;
      max-width: 60%;
      min-width: fit-content;
      label {
        width: 100%;
        text-align: right;
      }
    }
    .sender > label.timestamp,
    .receiver > label.timestamp {
      margin-bottom: 10px !important;
      font-size: 14px;
    }
    .receiver > label.timestamp {
      border: 1px solid #e2e2e2;
      border-width: 0 0 1px 0;
    }
    .sender > label.timestamp {
      border: 1px solid #ffffff4d;
      border-width: 0 0 1px 0;
    }
    .left {
      // display: flex;
      // justify-content: flex-start;
      display: grid;
      grid-template-columns: auto 80px;
    }
    .right {
      // display: flex;
      // justify-content: flex-end;
      display: grid;
      grid-template-columns: 80px auto;
    }
  }
}
</style>