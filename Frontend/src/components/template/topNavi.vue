<template>
  <div id="navi-bar">
    <div class="left">
      <div class="btn-back" @click="$router.go(-1)">
        <div class="icon">
          <img src="/img/btn/chevron.png" />
        </div>
        <label>Back</label>
      </div>
    </div>
    <div class="center" v-if="checkType == 'login'">
      <label>Sign in</label>
    </div>
    <div class="right" v-if="checkType == 'login'">
      <label>menu</label>
    </div>
  </div>
</template>

<script>
export default {
  name: "topNavibar",
  props: {
    type: String,
  },
  created() {
    this.checkType();
  },
  methods: {
    checkType: function () {
      if (this.$props.type == "login") {
        return "login";
      }
    },
  },
};
</script>

<style lang="scss">
#navi-bar {
  height: 60px;
  width: 100vw;
  grid-template-columns: 80px calc(100% - 160px) 80px;
  background-color: #fff;
  border: solid;
  border-width: 0 0 1px 0;
  border-color: #ededed;
  z-index: 20px;
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
    padding-left: 20px;
    .btn-back {
      display: flex;
      justify-content: center;
      align-items: center;
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
    width: calc(100% - 160px);
    justify-content: center;
    font-weight: 500;
    label {
      font-size: 18px;
      color: #202020;
      text-align: center;
      font-weight: 500;
    }
  }
  .right {
    width: 80px;
    justify-content: flex-end;
    padding-right: 20px;
  }
}
</style>