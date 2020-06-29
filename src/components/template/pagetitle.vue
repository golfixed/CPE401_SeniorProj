<template>
  <div id="app-title" class="app-statusbar">
    <label class="page-title">{{this.$store.state.currentPage}}</label>
    <div class="option-btn">
      <img src="/img/icons/threedots_white.svg" draggable="false" />
    </div>
  </div>
</template>

<script>
export default {
  name: "pagetitle"
};
</script>

<style lang="scss" scpoed>
#app-title {
  height: 60px;
  padding: 0 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: #e94a26;
  box-shadow: 0px 5px 25px rgba(0, 0, 0, 0.16);
  @media screen and (max-width: 375px) {
    padding: 0 20px;
  }
  .page-title {
    font-size: 2.25em;
    font-weight: bold;
    color: #fff;
  }
  .option-btn {
    width: 20px;
    height: 30px;
    display: flex;
    justify-content: flex-end;
    align-items: center;
    img {
      width: 20px;
    }
  }
}
</style>