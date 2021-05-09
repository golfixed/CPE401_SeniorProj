<template>
  <div>
    <div id="app">
      <div class="app-view">
        <topbar v-if="isLoggedIn == true" />
        <router-view />
        <assistBtn v-if="isLoggedIn == true" />
        <optionMenu v-if="isLoggedIn == true" />
        <div
          class="overlay-bg"
          v-if="overlayShow == true"
          v-on:click="closeAllMenu()"
        ></div>
      </div>
      <div class="app-tabbar" v-if="isLoggedIn == true">
        <tabbar />
      </div>
    </div>
  </div>
</template>

<script>
import tabbar from "@/components/template/tabbar";
import topbar from "@/components/template/topbar";
import assistBtn from "@/components/assistBtn.vue";
import optionMenu from "@/components/optionMenu.vue";
import welcomePage from "@/views/Welcome.vue";
export default {
  name: "app",
  components: {
    tabbar,
    topbar,
    assistBtn,
    optionMenu,
    welcomePage,
  },
  data() {
    return { isLoggedIn: false };
  },
  mounted() {
    if (localStorage.token) {
      this.isLoggedIn = true;
      this.$router.push({ path: "/" });
    }
  },
  computed: {
    overlayShow: function () {
      return this.$store.state.overlayShow;
    },
  },
  methods: {
    closeAllMenu: function () {
      this.$store.commit("Close_AllMenu");
    },
  },
};
</script>

<style lang="scss">
.pageslide-enter-active,
.pageslide-leave-enter {
  transform: translateY(0);
  transition: all 0.3s linear;
}
.pageslide-enter,
.pageslide-leave-to {
  transform: translateY(100%);
}

html,
body {
  overscroll-behavior-x: none;
  touch-action: manipulation;
}
body {
  -ms-touch-action: none;
  width: 100vw;
  height: 100vh;
  margin: 0;
  padding: 0;
  font-size: 12px;
  // background-color: #ffffff;
  overflow: hidden;
  -webkit-user-select: none;
  -webkit-touch-callout: none;
  @media screen and (max-width: 375px) {
    font-size: 10px;
  }
}
body::-webkit-scrollbar {
  display: none;
}
#app {
  font-family: Helvetica Neue, Roboto, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
  // background-color: #f8f8f8;
  h1,
  h2,
  h3,
  h4,
  h5,
  h6,
  label,
  span,
  li,
  ul,
  p {
    margin: 0;
    padding: 0;
  }
}
a {
  text-decoration: none;
  color: #505050;
}

input {
  border-style: solid;
}

// .app-statusbar {
//   padding-top: 20px !important;
//   // // iPhone XR, 11, 11 Pro Max
//   @media screen and (height: 848px) and (width: 414px) {
//     padding-top: 44px !important;
//   }

//   // iPhone X, 11 Pro
//   @media screen and (height: 768px) and (width: 375px) {
//     padding-top: 44px !important;
//   }

//   //iPhone 12 Pro
//   @media screen and (height: 797px) and (width: 390px) {
//     padding-top: 44px !important;
//   }
// }
.app-title-bar {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 80px;
  z-index: 5;
}
.app-tabbar {
  position: fixed;
  z-index: 10;
  bottom: 0;
  left: 0;
  width: 100vw;
  height: 60px;
  background: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(80px);

  // iPhone XR, 11, 11 Pro Max
  @media screen and (height: 848px) and (width: 414px) {
    height: 80px;
  }

  // iPhone X, 11 Pro
  @media screen and (height: 768px) and (width: 375px) {
    height: 80px;
  }

  //iPhone 12 Pro
  @media screen and (height: 797px) and (width: 390px) {
    height: 80px;
  }

  // iPhone 12 mini
  @media screen and (height: 762px) and (width: 375px) {
    height: 80px;
  }
}
.app-view {
  width: 100vw;
  height: 100vh;
  overflow: scroll;
}
.app-view::-webkit-scrollbar {
  display: none;
}

.section {
  .section-title {
    label {
      color: #9a9a9a;
      text-transform: uppercase;
      font-size: 1em;
      font-weight: bold;
    }
  }
}
.app-page {
  padding: 20px;
  padding-top: 0;
  background-color: #f6f6f6;

  // @media screen and (max-width: 375px) {
  //   padding: 20px;
  // }

  // // iPhone XR, 11, 11 Pro Max
  // @media screen and (height: 848px) and (width: 414px) {
  //   margin: 100px 0 100px 0 !important;
  // }

  // // iPhone X, 11 Pro
  // @media screen and (height: 768px) and (width: 375px) {
  //   margin: 100px 0 100px 0 !important;
  // }
}
.page-hr {
  border: solid;
  border-width: 1px 0 0 0;
  border-color: #f2f2f2;
  width: 100%;
}
#search-bar {
  padding: 0 20px;
  margin-top: 80px;
}
.search-bar-wrapper {
  background-color: #ffffff;
  padding: 0 20px;
  padding-bottom: 15px;
  margin: 0 -20px;
}
.app-default-searchbar {
  background-color: #f6f6f6;
  border-radius: 10px;
  height: 36px;
  padding: 0 20px;
  display: flex;
  justify-content: flex-start;
  align-items: center;
  outline: none;
  border: none;
  label {
    color: #8b8b8b;
    font-weight: normal;
    font-size: 16px;
    i {
      margin-right: 10px;
    }
  }
}
#section-favbar {
  padding: 0 20px;
}
.app-default-pinnedbar {
  height: fit-content;
  background-color: #ffffff;
  padding: 0px 20px 0px 20px;
  margin: 0px -20px;
  .pin-title {
    label {
      font-size: 16px;
      color: #8b8b8b;
      font-weight: 400;
    }
  }
  .pin-tray-wrap {
    margin: 0 -20px;

    div.slide-tray {
      padding: 20px;
      display: flex;
      flex-wrap: nowrap;
      overflow-x: auto;
    }
    div.slide-tray::-webkit-scrollbar {
      display: none;
    }
  }
}

.app-default-border-gray {
  border: solid;
  border-width: 0 0 1px 0;
  border-color: #ededed;
}
.app-default-border-gray-top {
  border: solid;
  border-width: 1px 0 0 0;
  border-color: #ededed;
}

.textline {
  display: -webkit-box;

  -webkit-box-orient: vertical;
  overflow: hidden;
  -webkit-box-pack: end;
}

.textline-1 {
  -webkit-line-clamp: 1;
}
.textline-2 {
  -webkit-line-clamp: 2;
}
.textline-3 {
  -webkit-line-clamp: 3;
}

input {
  background-color: #fff;
  border: solid;
  border-width: 1px;
  border-color: #ededed;
  border-radius: 10px;
  outline: none;
  height: 40px;
  width: 100%;
  text-indent: 20px;
  font-size: 16px;
  box-shadow: none;
}
button {
  background-color: #fff;
  border: solid;
  border-width: 1px;
  border-color: #ededed;
  border-radius: 10px;
  outline: none;
  height: 50px;
  width: 100%;
  label {
    font-size: 14px;
    line-height: 16px;
    font-weight: bold;
    color: #505050;
  }
  .single-land {
    display: flex;
    justify-content: center;
    align-items: center;
    div.img-wrapper {
      width: 25px;
      height: 25px;
      display: flex;
      justify-content: center;
      align-items: center;
      margin-right: 10px;
      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
    }
  }
}
button:active {
  background-color: rgb(250, 250, 250);
}
.bottom-btn {
  font-style: normal;
  font-weight: 500;
  font-size: 16px;
  line-height: 19px;
  text-align: center;
  text-decoration-line: underline;
  color: #479f60;
  width: 100%;
}
.hr-line {
  display: flex;
  justify-content: center;
  align-items: center;
  width: 100%;
  position: relative;
  height: 50px;
  div {
    border: 1px solid #ededed;
    border-width: 1px 0 0 0;
    width: 100%;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
  label {
    color: #505050;
    background-color: #f6f6f6;
    width: 30px;
    text-align: center;
    font-size: 16px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
  }
}
#page-home,
#page-classrooms,
#page-chats {
  height: fit-content;
}
.fullpage {
  position: fixed;
  height: 100vh;
  width: 100vw;
  top: 0;
  left: 0;
  overflow: hidden;
  z-index: 20;
  background-color: #ffffff;
  padding-bottom: 80px;
}

.content-page {
  margin-top: 60px;
  width: 100vw;
  height: calc(100vh - 61px);
  overflow: scroll;
  overflow-x: hidden;
  // .wrapper {
  //   height: 1500px;
  // }
}
.end-of-page {
  height: 100px;
  width: 100%;
}
.items-group {
  width: 100vw;
  margin-top: 20px;
  display: flex;
  justify-content: center;
  flex-direction: column;
  align-items: center;
  a {
    width: 100%;
  }
}
.page-content-none {
  width: 100vw;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: #f6f6f6;
  height: calc(100vh - 190px);
  .no-msg {
    text-align: center;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    .icon {
      width: 64px;
      height: 64px;
      margin-bottom: 20px;
    }
    .title {
      font-style: normal;
      font-weight: 500;
      font-size: 20px;
      line-height: 21px;
      text-align: center;
      color: #8b8b8b;
    }
    .desc {
      margin-top: 6px !important;
      font-style: normal;
      font-weight: normal;
      font-size: 16px;
      line-height: 20px;
      text-align: center;
      color: #8b8b8b;
    }
  }
}
.page-content-none-fullpage {
  height: calc(100vh - 61px);
}
.overlay-bg {
  background-color: #0000003b;
  width: 100vw;
  height: 100vh;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 20;
}
.bottom-section {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100vw;
  padding: 20px 0 20px 0;
  background-color: inherit;
  .btn-wrapper {
    width: 100%;
  }
}

.loading-page {
  z-index: 10;
  position: absolute;
  width: 100vw;
  height: 100%;
  top: 0;
  left: 0;
  /* margin-top: 61px; */
  background-color: #fff;
}
.loading-wrapper {
  width: 100vw;
  height: 100%;
  overflow: hidden;
}
.welcome-page {
  overflow: hidden;
}
.welcome-page,
.regis-page,
.login-page {
  z-index: 1000;
  position: absolute;
  width: 100vw;
  height: 100vh;
  top: 0;
  left: 0;
  background-color: #f6f6f6;
  width: 100vw;
  height: 100vh;
  display: grid;
  grid-template-rows: 40% 60%;
}
</style>
