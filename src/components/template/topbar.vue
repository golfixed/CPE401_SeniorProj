<template>
  <div>
    <div class="app-title-bar">
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
    </div>
    <div id="search-bar">
      <div class="search-bar-wrapper">
        <div v-on:click="openSearchPanel()" class="app-default-searchbar">
          <label v-if="currentRoute == '/'"
            ><i class="fas fa-search"></i>Search</label
          >
          <label v-if="currentRoute == '/classrooms'"
            ><i class="fas fa-search"></i>Search classrooms</label
          >
          <label v-if="currentRoute == '/chats'"
            ><i class="fas fa-search"></i>Search chats or contacts</label
          >
        </div>
      </div>
    </div>
    <div id="section-favbar">
      <div class="section app-default-pinnedbar app-default-border-gray">
        <div class="pin-title">
          <label v-if="currentRoute == '/'">Announcements</label>
          <label v-if="currentRoute == '/classrooms' && favClassList.length > 0"
            >Favourites</label
          >
          <label v-if="currentRoute == '/chats' && favChatList.length > 0"
            >Favourites</label
          >
        </div>
        <div class="pin-tray-wrap">
          <div class="slide-tray" v-if="currentRoute == '/'">
            <favPost
              v-for="items in favPostList"
              :key="items.id"
              v-bind:subject_code="items.subject_code"
              v-bind:subject_title="items.subject_title"
              v-bind:message="items.message"
              v-bind:time="items.time"
            />
          </div>
          <div class="slide-tray" v-if="currentRoute == '/chats'">
            <favChat
              v-for="items in favChatList"
              :key="items.id"
              v-bind:firstName="items.firstName"
              v-bind:profilePic="items.profilePic"
            />
          </div>
        </div>
      </div>
    </div>
    <div id="search-panel" v-if="this.$store.state.searchPageOpen == true">
      <searchPanel />
    </div>
  </div>
</template>

<script>
import favPost from "@/components/favpost.vue";
import favChat from "@/components/favchat.vue";
import searchPanel from "@/components/searchpage.vue";
export default {
  name: "pagetitle",
  created: function () {},
  components: {
    favPost,
    favChat,
    searchPanel,
  },
  methods: {
    openSearchPanel: function () {
      this.$store.commit("Open_searchPage");
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
  },
  data: function () {
    return {
      scrollPosition: null,
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
      favPostList: [
        {
          id: 1,
          time: "Jan 15 2021 10:23:25",
          subject_code: "CPE 401",
          subject_title: "Senior Project I",
          message:
            "There will be no class this week. Make-up class date will be annouce later.Your lab exercise score and quiz test score will be announced through LEB2, please check it out later.",
        },
        {
          id: 2,
          time: "Jan 10 2021 10:23:25",
          subject_code: "CPE 100",
          subject_title: "Basic Computer Programming Super super",
          message: "Tomorrow is the last day for LAB#3 submission.",
        },
        {
          id: 3,
          time: "Jan 9 2020 10:30:25",
          subject_code: "GEN 352",
          subject_title: "DIGITAL ELECTRONICS AND LOGIC DESIGN",
          message: "Tomorrow is the last day for LAB#3 submission.",
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
        {
          id: 4,
          firstName: "Peerapong",
          profilePic: "/img/mockup/profile.png",
        },
        {
          id: 5,
          firstName: "Bhaksiree",
          profilePic: "/img/mockup/profile_volk.png",
        },
        {
          id: 6,
          firstName: "Nithiwadee",
          profilePic: "/img/mockup/profile_my.png",
        },
      ],
      favClassList: [],
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
      font-weight: 500;
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
</style>