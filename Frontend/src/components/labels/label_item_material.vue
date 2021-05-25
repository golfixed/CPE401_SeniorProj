<template>
  <div class="label-material">
    <label class="text">{{ text }}</label>
    <div class="option-menu">
      <img src="/img/icons/label-btn.svg" />
    </div>
  </div>
</template>

<script>
export default {
  name: "list-material",
  props: {
    text: String,
    optional: Boolean,
  },
};
</script>

<style lang="scss" scoped>
.label-material {
  width: 100%;
  display: flex;
  justify-content: space-between;
  margin-bottom: 10px;
  label.text {
    font-style: normal;
    font-weight: bold;
    font-size: 16px;
    line-height: 19px;
    color: #505050;
    padding-left: 20px !important;
  }
  .option-menu {
    padding-right: 20px;
  }
}
</style>