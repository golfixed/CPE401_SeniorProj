<template>
  <div class="assist-btn-wrapper">
    <div class="assist-btn">
      <div class="btn-img">
        <img src="/img/btn/plus.svg" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "assist btn",
};
</script>

<style lang="scss" scoped>
.assist-btn-wrapper {
  position: absolute;
  z-index: 8;
  width: 66px;
  height: 66px;
  bottom: 120px;
  right: 40px;

  .assist-btn {
    width: 66px;
    height: 66px;
    display: flex;
    justify-content: center;
    align-items: center;
    background: linear-gradient(139.07deg, #3c6697 20.27%, #1e9f13 99.96%);
    border: 2px solid #ffffff;
    filter: drop-shadow(0px 5px 10px rgba(0, 0, 0, 0.2));
    border-radius: 100%;
    .btn-img {
      width: 25px;
      height: 25px;
      img {
        width: 100%;
        height: 100%;
      }
    }
  }
}
</style>