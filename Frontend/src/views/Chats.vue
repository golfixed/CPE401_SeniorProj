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
      <div class="no-msg">
        <img
          class="icon"
          src="/img/icons/page_undercon.svg"
          draggable="false"
        />
        <label class="title">Under developing...</label>
        <label class="desc"
          >This feature is not ready yet. <br />We will let you know once it is
          ready.</label
        >
      </div>
    </div>
  </div>
</template>

<script>
import chatItem from "@/components/lists/item_chat.vue";
import favChat from "@/components/fav_chat.vue";
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
    this.fetchChatList();
  },
  data: function () {
    return {
      chatList: [
        {
          id: 1,
          firstName: "Nithiwadee",
          lastName: "Wangviboonkij",
          picURL: "/img/mockup/profile_my.png",
          previewMessage: "Do not forget to submit your proposal within today",
          time: "12:30",
          read: false,
          lastReply: false,
        },
        {
          id: 2,
          firstName: "Bhaksiree",
          lastName: "Tongtago",
          picURL: "/img/mockup/profile_volk.png",
          previewMessage: "I got it. thx",
          time: "11:21",
          read: true,
          lastReply: true,
        },
        {
          id: 3,
          firstName: "Peerapong",
          lastName: "Thammakaew",
          picURL: "/img/mockup/profile.png",
          previewMessage: "I got it. thx",
          time: "09:30",
          read: true,
          lastReply: true,
        },
        {
          id: 4,
          firstName: "Peerapong",
          lastName: "Thammakaew",
          picURL: "/img/mockup/profile.png",
          previewMessage: "I got it. thx",
          time: "09:30",
          read: true,
          lastReply: true,
        },
        {
          id: 5,
          firstName: "Peerapong",
          lastName: "Thammakaew",
          picURL: "/img/mockup/profile.png",
          previewMessage: "I got it. thx",
          time: "09:30",
          read: true,
          lastReply: true,
        },
      ],
    };
  },
  created: function () {},
  methods: {
    fetchChatList() {
      axios.post;
    },
  },
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
