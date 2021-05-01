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
    <div class="center">
      <label>{{ pageName }}</label>
    </div>
  </div>
</template>

<script>
export default {
  name: "topNavibar",
  props: {
    pageName: String,
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
    padding-right: 20px;
  }
}
</style>