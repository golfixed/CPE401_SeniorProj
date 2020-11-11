<template>
  <div id="app-title" class="app-statusbar">
    <div class="titlebar-left">
      <div class="profile-btn">
        <img src="/img/mockup/profile.png" />
      </div>
      <label class="page-title">{{ this.$store.state.currentPage }}</label>
    </div>

    <div class="titlebar-right">
      <div class="top-btn" v-if="currentRoute == '/'">
        <i class="fas fa-bell"></i>
        <div class="noti-badge"></div>
      </div>
      <div
        class="top-btn"
        v-if="currentRoute == '/classrooms' || currentRoute == '/chats'"
      >
        <i class="fas fa-plus"></i>
      </div>
      <div class="top-btn">
        <i class="fas fa-bars"></i>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "pagetitle",
  computed: {
    currentRoute: function () {
      return this.$route.path;
    },
  },
};
</script>

<style lang="scss" scpoed>
#app-title {
  height: 80px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(80px);
  padding: 0 20px;
  @media screen and (max-width: 375px) {
    padding: 0 20px;
  }
  .titlebar-left,
  .titlebar-right {
    display: flex;
    align-items: center;
  }
  .titlebar-left {
    justify-content: flex-start;
    .profile-btn {
      height: 34px;
      width: 34px;
      border-radius: 100%;
      overflow: hidden;
      margin-right: 20px;
      img {
        height: 100%;
        width: 100%;
        object-fit: contain;
      }
    }
    .page-title {
      font-size: 2.25em;
      font-style: normal;
      font-weight: bold;
      background: linear-gradient(
        135deg,
        rgba(60, 102, 151, 1) 0%,
        rgba(59, 155, 80, 1) 100%
      );
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
  }
  .titlebar-right {
    display: flex;
    align-items: center;
    justify-content: flex-end;
    .top-btn {
      width: 25px;
      height: 50px;
      margin-right: 20px;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      i {
        font-size: 24px;
        background: linear-gradient(
          135deg,
          rgba(60, 102, 151, 1) 0%,
          rgba(59, 155, 80, 1) 100%
        );
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
      }
      div.noti-badge {
        height: 10px;
        width: 10px;
        background-color: #df5d5d;
        border-radius: 100px;
        position: absolute;
        top: 10px;
        right: -5px;
      }
    }
    .top-btn:last-child {
      margin-right: 0;
    }
  }
}
</style>