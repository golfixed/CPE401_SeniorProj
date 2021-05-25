<template>
  <div>
    <div class="app-title-bar">
      <div id="app-title" class="app-statusbar">
        <div class="titlebar-left">
          <div class="profile-btn">
            <router-link to="/settings">
              <img
                src="/img/default_profile.svg"
                v-if="userProfilePic == null"
              />
              <img :src="userProfilePic" v-if="userProfilePic == null" />
            </router-link>
          </div>
          <label class="page-title">Hi, {{ userName }}</label>
        </div>
        <div class="titlebar-right">
          <div class="top-btn">
            <div class="btn-img-wrapper topbar-plus-btn" id="topbar-plus-btn">
              <img src="/img/icons/plus-btn.svg" />
            </div>
          </div>
          <router-link
            to="/notification"
            class="top-btn"
            style="margin-right: 10px"
          >
            <div class="btn-img-wrapper">
              <img src="/img/icons/noti-bell.svg" />
            </div>
            <div v-if="notifications.length > 0" class="noti-badge">
              {{ notifications.length }}
            </div>
          </router-link>
          <!-- <div class="top-btn" v-on:click="openOptionMenu('home')">
            <div class="btn-img-wrapper">
              <img src="/img/icons/option-menu.svg" />
            </div>
          </div> -->
        </div>
      </div>
    </div>
    <div id="search-bar">
      <div class="search-bar-wrapper">
        <router-link to="/search">
          <div class="app-default-searchbar">
            <label><i class="fas fa-search"></i>Search</label>
          </div>
        </router-link>
      </div>
    </div>
    <div id="section-favbar">
      <div
        id="pinned-bar"
        class="section app-default-pinnedbar"
        v-if="currentRoute == '/sss' && favPostList.length > 0"
      >
        <div class="pin-title">
          <label>Announcements</label>
        </div>
        <div class="pin-tray-wrap">
          <div class="slide-tray">
            <favPost
              v-for="items in favPostList"
              :key="items.id"
              v-bind:subject_code="items.subject_code"
              v-bind:subject_title="items.subject_title"
              v-bind:message="items.message"
              v-bind:time="items.time"
              v-bind:pic="items.profile_pic"
              @openPost="openAncmt(items.id)"
            />
          </div>
        </div>
      </div>

      <!-- <div
        id="pinned-bar"
        class="section app-default-pinnedbar"
        v-if="currentRoute == '/chats' && favChatList.length > 0"
      >
        <div class="pin-title">
          <label>Favourites</label>
        </div>
        <div class="pin-tray-wrap">
          <div class="slide-tray">
            <favChat
              v-for="items in favChatList"
              :key="items.id"
              v-bind:firstName="items.firstName"
              v-bind:profilePic="items.profilePic"
            />
            <favChat
              firstName="add new"
              profilePic="/img/btn/chat/plus_circle.svg"
            />
          </div>
        </div>
      </div> -->
    </div>
  </div>
</template>

<script>
import favPost from "@/components/fav_post.vue";
import favChat from "@/components/fav_chat.vue";

export default {
  name: "Page-TopBar",
  created: function () {},
  components: {
    favPost,
    favChat,
  },
  methods: {
    openAncmt: function (id) {
      this.favPostClicked = this.favPostList[id];
    },
    openOptionMenu: function (payload) {
      this.$store.commit("Open_optionMenu", payload);
    },
  },
  mounted() {
    document.querySelector(".app-view").addEventListener("scroll", function () {
      var scrollTop = document.querySelector(".app-view").scrollTop;
      var topbarClasses = document.querySelector(".app-title-bar").classList;

      if (scrollTop >= 10) {
        if (topbarClasses.contains("app-default-border-gray") === false) {
          topbarClasses.toggle("app-default-border-gray");
        }
      } else {
        if (topbarClasses.contains("app-default-border-gray") === true) {
          topbarClasses.toggle("app-default-border-gray");
        }
      }
    });
  },
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
    // iconToShow: function () {
    //   var page = this.currentRoute;
    //   if (page == "/") return "/img/icons/topbar-write.svg";
    //   else return "/img/icons/plus-btn.svg";
    // },
  },
  data: function () {
    return {
      scrollPosition: null,
      userProfilePic: this.$store.state.user.profile.pic,
      userName: this.$store.state.user.profile.firstname,
      favPostClicked: {
        id: 0,
        firstName: "Bhaksiree",
        lastName: "Tongtago",
        profile_pic: "/img/mockup/profile_volk.png",
        time: "Jan 15 2021 10:23:25",
        subject_code: "CPE 401",
        subject_title: "Senior Project I",
        isSeen: false,
        message:
          "There will be no class this week. Make-up class date will be annouce later.Your lab exercise score and quiz test score will be announced through LEB2, please check it out later.",
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
      favPostList: [
        {
          id: 0,
          firstName: "Bhaksiree",
          lastName: "Tongtago",
          profile_pic: "/img/mockup/profile_volk.png",
          time: "Jan 15 2021 10:23:25",
          subject_code: "CPE 401",
          subject_title: "Senior Project I",
          isSeen: false,
          message:
            "There will be no class this week. Make-up class date will be annouce later.Your lab exercise score and quiz test score will be announced through LEB2, please check it out later.",
        },
        {
          id: 1,
          firstName: "Peerapong",
          lastName: "Thammakaew",
          profile_pic: "/img/mockup/profile.png",
          time: "Jan 10 2021 10:23:25",
          subject_code: "CPE 100",
          subject_title: "Basic Computer Programming Super super",
          message: "Tomorrow is the last day for LAB#3 submission.",
          isSeen: false,
        },
        {
          id: 2,
          firstName: "Nithiwadee",
          lastName: "Wangviboonkij",
          profile_pic: "/img/mockup/profile_my.png",
          time: "Jan 9 2020 10:30:25",
          subject_code: "GEN 352",
          subject_title: "DIGITAL ELECTRONICS AND LOGIC DESIGN",
          message: "Tomorrow is the last day for LAB#3 submission.",
          isSeen: false,
        },
      ],
      favChatList: [
        {
          id: 1,
          firstName: "Peerapong",
          profilePic: "/img/mockup/profile.png",
        },
        {
          id: 2,
          firstName: "Nithiwadee",
          profilePic: "/img/mockup/profile_my.png",
        },
        {
          id: 3,
          firstName: "Bhaksiree",
          profilePic: "/img/mockup/profile_volk.png",
        },
      ],
      favClassList: [
        {
          id: 0,
          code: "CPE100",
          subject: "Basic Computer Programming I",
          section: 2,
          pictureURL: "/img/mockup/class.png",
          isPinned: true,
          prevMember: [
            {
              id: 0,
              pictureURL: "/img/mockup/profile.png",
            },
            {
              id: 1,
              pictureURL: "/img/mockup/profile_volk.png",
            },
            {
              id: 2,
              pictureURL: "/img/mockup/profile_my.png",
            },
          ],
        },
        {
          id: 1,
          code: "CPE100",
          subject: "Basic Computer Programming I",
          section: 2,
          pictureURL: "/img/mockup/class.png",
          isPinned: true,
          prevMember: [
            {
              id: 0,
              pictureURL: "/img/mockup/profile.png",
            },
            {
              id: 1,
              pictureURL: "/img/mockup/profile_volk.png",
            },
            {
              id: 2,
              pictureURL: "/img/mockup/profile_my.png",
            },
          ],
        },
        {
          id: 2,
          code: "CPE100",
          subject: "Basic Computer Programming I",
          section: 2,
          pictureURL: "/img/mockup/class.png",
          isPinned: false,
          prevMember: [
            {
              id: 0,
              pictureURL: "/img/mockup/profile.png",
            },
            {
              id: 1,
              pictureURL: "/img/mockup/profile_volk.png",
            },
            {
              id: 2,
              pictureURL: "/img/mockup/profile_my.png",
            },
          ],
        },
        {
          id: 3,
          code: "CPE100",
          subject: "Basic Computer Programming I",
          section: 2,
          pictureURL: "/img/mockup/class.png",
          isPinned: true,
          prevMember: [
            {
              id: 0,
              pictureURL: "/img/mockup/profile.png",
            },
            {
              id: 1,
              pictureURL: "/img/mockup/profile_volk.png",
            },
            {
              id: 2,
              pictureURL: "/img/mockup/profile_my.png",
            },
          ],
        },
      ],
    };
  },
};
</script>

<style lang="scss" scpoed>
#fullPage-favPost {
  // position: absolute;
  z-index: 10;
  width: 100vw;
  transition: all 0.3s;
  display: flex;
  justify-content: center;
  align-items: center;
}
.favPost-show {
  top: 0 !important;
  transition: all 0.3s;
}
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
        width: fit-content;
        min-width: 18px;
        // padding: 0 5px;
        background-color: #df5d5d;
        border-radius: 100px;
        position: absolute;
        top: 5px;
        right: -8px;
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

#search-panel {
  position: absolute;
  top: 100vh;
  left: 0;
  transition: all 0.3s;
  height: 100vh;
  width: 100vw;
  z-index: 10;
  background-color: #fff;
}

.search-panel-show {
  top: 0 !important;
  transition: all 0.6s;
}
.topbar-plus-btn {
  opacity: 0;
  transition: all 0.3s;
  transform: scale(0.5);
}
.topbar-plus-btn-show {
  opacity: 1;
  transition: all 0.3s;
  transition-delay: 0.4s;
  transform: scale(1);
}
</style>