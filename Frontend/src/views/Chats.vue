<template>
  <div id="page-chats">
    <div class="page-list-wrapper" v-if="chatList.length > 0">
      <!-- <div
        id="pinned-bar"
        class="section app-default-pinnedbar"
        v-if="chatList.length > 0"
      >
        <div class="pin-title">
          <label>Favourites</label>
        </div>
        <div class="pin-tray-wrap">
          <div class="slide-tray">
            <favChat
              v-for="item in chatList"
              :key="item.id"
              v-bind:chat_id="item.id"
              v-bind:fname="item.firstName"
              v-bind:picURL="item.picURL"
            />
            <favChat fname="add new" picURL="/img/btn/chat/plus_circle.svg" />
          </div>
        </div>
      </div> -->
      <div class="pin-title-chat">
        <label>Chats</label>
      </div>
      <div class="chat-item">
        <chatItem
          v-for="item in chatList"
          :key="item.id"
          v-bind:fname="item.firstName"
          v-bind:lname="item.lastName"
          v-bind:picURL="item.picURL"
          v-bind:previewMessage="item.previewMessage"
          v-bind:time="item.time"
          v-bind:read="item.read"
          v-bind:lastReply="item.lastReply"
          v-bind:chat_id="item.id"
        />
        <div class="end-of-page"></div>
      </div>
    </div>

    <div class="page-content-none" v-if="chatList.length == 0">
      <div class="no-msg" v-on:click="fetchChatList()">
        <img class="icon" src="/img/icons/home_blank.svg" draggable="false" />
        <label class="title">No any conversation</label>
        <label class="desc"
          >To start chatting with classmates, <br />tap Member tab in
          classroom.</label
        >
      </div>
    </div>
  </div>
</template>

<script>
import chatItem from "@/components/lists/item_chat.vue";
import favChat from "@/components/fav_chat.vue";
import axios from "@/axios.js";
export default {
  name: "Chats-Page",
  components: {
    chatItem,
    favChat,
  },
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }
    this.$store.commit("Close_AllMenu");
    // this.fetchChatList();
    console.log("CHAT_PAGE");
  },
  data: function () {
    return {
      chatList: [],
    };
  },
  methods: {
    fetchChatList: function () {
      axios
        .post("/chatlist", { account_id: this.$store.state.user.profile.id })
        .then((res) => {
          console.log(res);
          // if (res.data.error != true) {
          //   console.log("IF");
          //   console.log(res.data.data);
          //   this.chatList = res.data.data;
          // } else {
          //   console.log("ELSE");
          //   this.chatList = this.chatList;
          // }
        });
    },
  },
  created: function () {},
};
</script>
<style lang="scss" scoped>
.page-list-wrapper {
  padding: 10px 20px 0px 20px;
  padding-top: 0;
}
.pin-title-chat {
  font-size: 16px;
  color: #8b8b8b;
  font-weight: 400;
  margin-bottom: 5px;
  // padding-top: 15px;
}
</style>
