<template>
  <div class="item-wrapper" v-on:click="openProfile(account_id)">
    <div class="contact-item">
      <div class="profile-pic">
        <img :src="pictureURL" v-if="pictureURL" draggable="false" />
        <img
          src="/img/default_profile.svg"
          v-if="!pictureURL"
          draggable="false"
        />
      </div>
      <div class="text">
        <label class="name">{{ fname }} {{ lname }} id:{{ account_id }}</label>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "contact-list",
  props: {
    id: Number,
    pictureURL: String,
    fname: String,
    lname: String,
    time: String,
    read: Boolean,
    lastReply: Boolean,
    account_id: Number,
  },
  methods: {
    openProfile(account_id) {
      console.log("account_id: " + account_id);
      if (account_id) this.$router.push("/profile/" + account_id);
      else console.log("error no account_id");
    },
  },
};
</script>

<style lang="scss" scoped>
.item-wrapper {
  padding: 0 20px;
  width: 100%;
  max-width: 100vw;
}
// .contact-item:first-child {
//   padding-top: 10px;
// }
// .contact-item:last-child {
//   padding-bottom: 10px;
// }
.contact-item {
  width: 100%;
  padding: 10px 0;
  max-width: 100vw;
  display: flex;
  background-color: #fff;
  .profile-pic {
    width: 44px;
    height: 44px;
    border-radius: 100%;
    overflow: hidden;
    margin-left: 20px;
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
      font-weight: normal;
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