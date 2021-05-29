<template>
  <div class="fav-chat" v-on:click="openChat(chat_id)">
    <div class="fav-chat-box">
      <div class="profile-pic-wrapper">
        <img class="profile-pic" :src="picURL" />
      </div>
      <label>{{ fname }}</label>
    </div>
  </div>
</template>

<script>
export default {
  name: "fav-chat",
  props: {
    chat_id: Number,
    picURL: String,
    fname: String,
    lname: String,
    previewMessage: String,
    time: String,
    read: Boolean,
    lastReply: Boolean,
  },
  data: function () {
    return {};
  },
  methods: {
    openChat() {
      if (this.chat_id) {
        this.$router.push("/chat/" + this.chat_id);
      }
    },
  },
};
</script>

<style lang="scss" scoped>
.fav-chat {
  margin: 0 12.5px;
  //   filter: drop-shadow(0px 2px 10px rgba(0, 0, 0, 0.15));
  .fav-chat-box {
    display: flex;
    height: fit-content;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    .profile-pic-wrapper {
      width: 70px;
      height: 70px;
      margin-bottom: 15px;
      border-radius: 100px;
      overflow: hidden;
      box-shadow: 0px 5px 25px 4px rgb(0 0 0 / 7%);
      img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    }
    label {
      font-style: normal;
      font-weight: 600;
      font-size: 14px;
      line-height: 16px;
      color: #505050;
    }
  }
}
.fav-chat:first-child {
  margin-left: 0px;
}
.fav-chat:last-child {
  padding-right: 20px;
}
</style>