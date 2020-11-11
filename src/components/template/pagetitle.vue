<template>
  <div id="app-title" class="app-statusbar">
    <div class="titlebar-left">
      <div class="profile-btn">
        <img src="/img/mockup/profile.png" />
      </div>
      <label class="page-title">{{ this.$store.state.currentPage }}</label>
    </div>

    <div class="titlebar-right">
      <div class="option-btn">
        <img src="/img/icons/threedots_white.svg" draggable="false" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "pagetitle",
};
</script>

<style lang="scss" scpoed>
#app-title {
  height: 60px;
  padding: 0 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  background: rgba(255, 255, 255, 0.8);
  backdrop-filter: blur(80px);
  padding: 5px 20px 20px 20px;
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
      font-weight: bold;
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
    justify-content: flex-end;
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
}
</style>