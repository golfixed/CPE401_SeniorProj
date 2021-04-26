<template>
  <router-link :to="link" class="option-menu">
    <div class="option-icon"><img :src="iconURL" draggable="false" /></div>
    <div class="option-label app-default-border-gray">
      <label>{{ label }}</label>
    </div>
  </router-link>
</template>

<script>
export default {
  name: "option-menu-item",
  props: {
    link: String,
    iconURL: String,
    label: String,
  },
};
</script>

<style lang="scss" scoped>
.option-menu {
  width: -webkit-fill-available;
  display: flex;
  .option-icon {
    width: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    img {
      width: 20px;
      height: 20px;
    }
  }
  .option-label {
    display: flex;
    align-items: center;
    height: 60px;
    width: -webkit-fill-available;
    label {
      width: -webkit-fill-available;
      font-style: normal;
      font-weight: normal;
      font-size: 16px;
      line-height: 19px;
      color: #202020;
    }
  }
}
.option-menu:first-child {
  margin-top: 10px;
}
</style>