<template>
  <div id="app-title" class="app-statusbar">
    <div class="titlebar-left">
      <div class="profile-btn">
        <img :src="this.user.picture_url" />
      </div>
      <label class="page-title">{{ currentPage }}</label>
    </div>

    <div class="titlebar-right">
      <div class="top-btn" v-if="currentRoute == '/'">
        <div class="btn-img-wrapper">
          <img src="/img/icons/noti-bell.svg" />
        </div>
        <div v-if="notifications.length > 0" class="noti-badge">
          {{ notifications.length }}
        </div>
      </div>
      <div
        class="top-btn"
        v-if="currentRoute == '/classrooms' || currentRoute == '/chats'"
      >
        <div class="btn-img-wrapper">
          <img src="/img/icons/plus-btn.svg" />
        </div>
      </div>
      <div class="top-btn">
        <div class="btn-img-wrapper">
          <img src="/img/icons/option-menu.svg" />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "pagetitle",
  created: function () {},
  computed: {
    currentRoute: function () {
      return this.$route.path;
    },
    currentPage: function () {
      var page = this.$route.path;
      if (page == "/") return "Home";
      else if (page == "/classrooms") return "Classrooms";
      else if (page == "/chats") return "Chats";
      else return "";
    },
  },
  data: function () {
    return {
      user: {
        picture_url: "/img/mockup/profile.png",
      },
      notifications: [
        {
          id: 1,
          title: "This is a testing notification text",
        },
        {
          id: 2,
          title: "This is a testing notification text",
        },
        {
          id: 3,
          title: "This is a testing notification text",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scpoed>
#app-title {
  height: 80px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: rgba(255, 255, 255, 1);
  // backdrop-filter: blur(80px);
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
      font-weight: 600;
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
      width: 20px;
      height: 50px;
      margin-right: 30px;
      display: flex;
      align-items: center;
      justify-content: center;
      position: relative;
      div.btn-img-wrapper {
        display: flex;
        justify-content: center;
        align-items: center;
      }
      div.noti-badge {
        height: 18px;
        width: 18px;
        background-color: #df5d5d;
        border-radius: 100px;
        position: absolute;
        top: 8px;
        right: -4px;
        color: #fff;
        display: flex;
        justify-content: center;
        align-items: center;
        font-size: 1em;
        font-weight: 600;
        box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.15);
      }
    }
    .top-btn:last-child {
      margin-right: 0;
    }
  }
}
</style>