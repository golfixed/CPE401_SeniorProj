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
    pagetitle
  }
};
</script>

<style lang="scss">
html {
  background-color: #e94a26;
}
body {
  width: 100vw;
  height: 100vh;
  margin: 0;
  padding: 0;
  font-size: 12px;
  background-color: #e94a26;
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
  background-color: #f8f8f8;
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

.app-statusbar {
  padding-top: 20px !important;
  // iPhone XR, 11, 11 Pro Max
  @media screen and (height: 852px) and (width: 414px) {
    padding-top: 44px !important;
  }

  // iPhone X, 11 Pro
  @media screen and (height: 768px) and (width: 375px) {
    padding-top: 44px !important;
  }
}
.app-pagetitle {
  position: fixed;
  top: 0;
  left: 0;
  width: 100vw;
  height: 60px;
}
.app-tabbar {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100vw;
  height: 60px;

  // iPhone XR, 11, 11 Pro Max
  @media screen and (height: 852px) and (width: 414px) {
    height: 80px;
  }

  // iPhone X, 11 Pro
  @media screen and (height: 768px) and (width: 375px) {
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
  margin: 80px 0 100px 0;
  padding: 30px;

  @media screen and (max-width: 375px) {
    padding: 20px;
  }

  // iPhone XR, 11, 11 Pro Max
  @media screen and (height: 852px) and (width: 414px) {
    margin: 104px 0 100px 0 !important;
  }

  // iPhone X, 11 Pro
  @media screen and (height: 768px) and (width: 375px) {
    margin: 104px 0 100px 0 !important;
  }
}
.page-hr {
  border: solid;
  border-width: 1px 0 0 0;
  border-color: #f2f2f2;
  width: 100%;
}
</style>
