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
    width: 64px;
    height: fit-content;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    .profile-pic-wrapper {
      width: 64px;
      height: 64px;
      margin-bottom: 10px;
      img {
        width: 100%;
        height: 100%;
        border-radius: 100000px;
        object-fit: contain;
      }
    }
    label {
      font-size: 1em;
      font-weight: 400;
      color: #8b8b8b;
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