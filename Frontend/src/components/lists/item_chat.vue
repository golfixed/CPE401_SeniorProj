<template>
  <div class="chat-item">
    <div class="profile-pic">
      <img :src="pictureURL" draggable="false" />
    </div>
    <div class="text">
      <label class="name">{{ fname }} {{ lname }}</label>
      <div class="preview">
        <label class="reply" v-if="lastReply == true"> You: </label>
        <label class="read" v-if="read == true">{{ previewMessage }}</label>
        <label class="unread" v-if="read == false">{{ previewMessage }}</label>
      </div>
    </div>
    <div class="misc">
      <label class="time">{{ time }}</label>
      <div class="unread" v-if="read == false">
        <img src="/img/btn/chat/dot_red.svg" draggable="false" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "chat-list",
  props: {
    pictureURL: String,
    fname: String,
    lname: String,
    previewMessage: String,
    time: String,
    read: Boolean,
    lastReply: Boolean,
  },
};
</script>

<style lang="scss" scoped>
.chat-item {
  width: 100%;
  padding: 10px 0;
  max-width: 100vw;
  display: grid;
  grid-template-columns: 54px auto 40px;
  .profile-pic {
    width: 54px;
    height: 54px;
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
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
    text-indent: 15px;
    .name,
    .preview {
      display: -webkit-box;
      -webkit-box-orient: vertical;
      overflow: hidden;
      -webkit-box-pack: end;
      -webkit-line-clamp: 1;
    }
    .name {
      font-style: normal;
      font-weight: bold;
      font-size: 16px;
      line-height: 19px;
      color: #202020;
    }
    .preview {
      margin-top: 5px !important;
      .read,
      .reply {
        font-style: normal;
        font-weight: normal;
        font-size: 14px;
        line-height: 16px;
        color: #808080;
      }
      .unread {
        font-style: normal;
        font-weight: 500;
        font-size: 14px;
        line-height: 16px;
        color: #202020;
      }
    }
  }
  .misc {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    .time {
      font-style: normal;
      font-weight: 300;
      font-size: 14px;
      line-height: 16px;
      text-align: center;
      color: #c9c9c9;
    }
    .unread {
      margin-top: 8px;
      width: 13px;
      height: 13px;
      border-radius: 100%;
      overflow: hidden;
      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
    }
  }
}
</style>