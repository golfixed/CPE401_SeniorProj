<template>
  <div id="navi-bar">
    <div class="left">
      <div class="btn-back" @click="$router.go(-1)" v-if="type == 'back'">
        <div class="icon">
          <img src="/img/btn/chevron.png" />
        </div>
        <label>Back</label>
      </div>
      <div class="btn-back" @click="$router.go(-1)" v-if="type == 'cancel'">
        <div class="icon">
          <img src="/img/btn/chevron.png" />
        </div>
        <label>Cancel</label>
      </div>
      <div class="btn-back" @click="$router.push('/')" v-if="type == 'gohome'">
        <div class="icon">
          <img src="/img/btn/chevron.png" />
        </div>
        <label>Back</label>
      </div>
    </div>
    <div class="center">
      <label>{{ pageName }}</label>
    </div>
    <div class="right">
      <div
        class="btn-img-wrapper"
        v-on:click="openOptionMenu(optionName)"
        v-if="menu == true"
      >
        <img src="/img/icons/option-menu.svg" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "topNavibar",
  props: {
    pageName: String,
    type: String,
    menu: Boolean,
    optionName: String,
  },
  methods: {
    openOptionMenu: function (payload) {
      this.$store.commit("Open_optionMenu", payload);
    },
  },
};
</script>

<style lang="scss">
#navi-bar {
  height: 60px;
  width: 100vw;
  display: grid;
  grid-template-columns: 80px calc(100% - 160px) 80px;
  background-color: #fff;
  border: solid;
  border-width: 0 0 1px 0;
  border-color: #ededed;
  z-index: 20;
  position: fixed;
  top: 0;
  left: 0;
  //   background-color: green;
  .left,
  .center,
  .right {
    height: 100%;
    display: flex;
    align-items: center;
  }
  .left {
    width: 80px;
    // background-color: red;
    justify-content: flex-start;
    .btn-back {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-left: 20px;
      height: 100%;
      div.icon {
        width: 15px;
        height: 15px;
        display: flex;
        align-items: center;
        justify-content: center;
        img {
          width: 100%;
          height: 100%;
          object-fit: contain;
        }
      }
      label {
        font-size: 14px;
        color: #505050;
        margin-left: 10px;
      }
    }
  }
  .center {
    width: -webkit-fill-available;
    justify-content: center;
    font-weight: 500;
    label {
      width: 100%;
      text-align: center;
      font-size: 18px;
      color: #202020;
      text-align: center;
      font-weight: 500;
    }
  }
  .right {
    width: 80px;
    justify-content: flex-end;
    .btn-img-wrapper {
      margin-right: 20px;
      display: flex;
      justify-content: center;
      align-items: center;
    }
  }
}
</style>