<template>
  <div id="app">
    <div class="app-view">
      <topbar />
      <router-view />
    </div>
    <div class="app-tabbar">
      <tabbar />
    </div>
  </div>
</template>

<script>
import tabbar from "@/components/template/tabbar";
import topbar from "@/components/template/topbar";
export default {
  name: "app",
  components: {
    tabbar,
    topbar,
  },
};
</script>

<style lang="scss">
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
</style>
