<template>
  <div id="app">
    <div class="app-pagetitle">
      <pagetitle />
    </div>
    <div class="app-view">
      <router-view />
    </div>
    <div class="app-tabbar">
      <tabbar />
    </div>
  </div>
</template>

<script>
import tabbar from "@/components/template/tabbar";
import pagetitle from "@/components/template/pagetitle";
export default {
  name: "app",
  components: {
    tabbar,
    pagetitle,
  },
};
</script>

<style lang="scss">
html,
body {
  overscroll-behavior-x: none;
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
.app-pagetitle {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 80px;
  z-index: 5;
}
.app-tabbar {
  position: fixed;
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
}
.app-view {
  width: 100vw;
  height: 100vh;
  overflow: scroll;
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
  margin: 80px 0 60px 0;
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
#searchbar {
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
.app-default-pinnedbar {
  height: fit-content;
  background-color: #ffffff;
  padding: 0px 20px 0px 20px;
  margin: 0px -20px;
  .pin-title {
    padding-bottom: 15px;
    label {
      font-size: 16px;
      color: #8b8b8b;
      font-weight: 400;
    }
  }
  .pin-tray-wrap {
    margin: 0 -20px;

    div.slide-tray {
      padding: 0 20px 20px 20px;
      display: flex;
      flex-wrap: nowrap;
      overflow-x: auto;
    }
    div.slide-tray::-webkit-scrollbar {
      display: none;
    }
  }
}

.app-default-borer-gray {
  border: solid;
  border-width: 0 0 1px 0;
  border-color: #ededed;
}
//Misc Styles
.card {
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
}
.card-wrapper {
  padding: 0 5px;
}
.card-wrapper:first-child {
  padding-left: 0px;
}
.card-wrapper:last-child {
  padding-right: 20px;
}
</style>
