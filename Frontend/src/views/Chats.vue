<template>
  <div id="page-chats" class="app-default-border-gray-top">
    <!-- <div class="page-list-wrapper" v-if="chatList.length > 0">
      <div class="chat-item">
        <chatItem
          v-for="items in chatList"
          :key="items.id"
          v-bind:fname="items.firstName"
          v-bind:lname="items.lastName"
          v-bind:picURL="items.picURL"
          v-bind:previewMessage="items.previewMessage"
          v-bind:time="items.time"
          v-bind:read="items.read"
          v-bind:lastReply="items.lastReply"
        />
        <div class="end-of-page"></div>
      </div>
    </div> -->

    <div class="page-content-none">
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
export default {
  name: "Chats-Page",
  components: {
    chatItem,
  },
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }
  },
  data: function () {
    return {
      chatList2: [
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
        {
          id: 6,
          firstName: "Peerapong",
          lastName: "Thammakaew",
          picURL: "/img/mockup/profile.png",
          previewMessage: "I got it. thx",
          time: "09:30",
          read: true,
          lastReply: true,
        },
        {
          id: 7,
          firstName: "Peerapong",
          lastName: "Thammakaew",
          picURL: "/img/mockup/profile.png",
          previewMessage: "I got it. thx",
          time: "09:30",
          read: true,
          lastReply: true,
        },
        {
          id: 8,
          firstName: "Peerapong",
          lastName: "Thammakaew",
          picURL: "/img/mockup/profile.png",
          previewMessage: "I got it. thx",
          time: "09:30",
          read: true,
          lastReply: true,
        },
        {
          id: 9,
          firstName: "Peerapong",
          lastName: "Thammakaew",
          picURL: "/img/mockup/profile.png",
          previewMessage: "I got it. thx",
          time: "09:30",
          read: true,
          lastReply: true,
        },
        {
          id: 10,
          firstName: "Peerapong",
          lastName: "Thammakaew",
          picURL: "/img/mockup/profile.png",
          previewMessage: "I got it. thx",
          time: "09:30",
          read: true,
          lastReply: true,
        },
        {
          id: 11,
          firstName: "Peerapong",
          lastName: "Thammakaew",
          picURL: "/img/mockup/profile.png",
          previewMessage: "I got it. thx",
          time: "09:30",
          read: true,
          lastReply: true,
        },
        {
          id: 12,
          firstName: "Peerapong",
          lastName: "Thammakaew",
          picURL: "/img/mockup/profile.png",
          previewMessage: "I got it. thx",
          time: "09:30",
          read: true,
          lastReply: true,
        },
        {
          id: 13,
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
  methods: {},
};
</script>
<style lang="scss" scoped>
.page-list-wrapper {
  padding: 10px 20px 0px 20px;
}
</style>
