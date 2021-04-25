<template>
  <div id="page-home" class="app-default-border-gray-top">
    <div class="page-list-wrapper" v-if="chatList.length > 0">
      <div class="chat-item">
        <chatItem
          v-for="items in chatList"
          :key="items.id"
          v-bind:name="items.firstName + items.lastName"
          v-bind:picURL="items.picURL"
          v-bind:previewMessage="items.previewMessage"
          v-bind:time="items.time"
          v-bind:read="items.read"
          v-bind:lastReply="items.lastReply"
        />
      </div>
    </div>
    <div class="page-content-none" v-if="chatList.length == 0">
      <div class="no-msg">
        <label class="title">Start a New Message</label>
        <label class="desc"
          >Tap the + button at bottom right<br />
          to start a new chatroom.</label
        >
      </div>
    </div>
  </div>
</template>

<script>
import chatItem from "@/components/lists/item_chat.vue";
export default {
  name: "Chats",
  components: {
    chatItem,
  },
  data: function () {
    return {
      chatList: [
        {
          id: 0,
          firstName: "Nithiwadee",
          lastName: "Wangviboonkij",
          picURL: "/img/mockup/profile_my.png",
          previewMessage: "Do not forget to submit your proposal within today",
          time: "12:30",
          read: false,
          lastReply: false,
        },
        {
          id: 1,
          firstName: "Bhaksiree",
          lastName: "Tongtago",
          picURL: "/img/mockup/profile_volk.png",
          previewMessage: "I got it. thx",
          time: "11:21",
          read: true,
          lastReply: true,
        },
        {
          id: 2,
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
    openSearchPage: function () {
      console.log("clicked");
      this.$store.commit("Open_searchPage");
    },
  },
};
</script>
<style lang="scss" scoped>
.page-list-wrapper {
  padding: 10px 20px 100px 20px;
}
</style>
