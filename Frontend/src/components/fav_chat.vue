<template>
  <div class="fav-chat">
    <div class="fav-chat-box">
      <div class="profile-pic-wrapper">
        <img class="profile-pic" :src="profilePic" />
      </div>
      <label>{{ firstName }}</label>
    </div>
  </div>
</template>

<script>
export default {
  name: "fav-chat",
  props: {
    firstName: String,
    profilePic: String,
  },
  data: function () {
    return {};
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
      width: 84px;
      height: 84px;
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