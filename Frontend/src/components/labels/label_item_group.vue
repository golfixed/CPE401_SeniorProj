<template>
  <div class="label-box">
    <label>{{ text }}</label>
  </div>
</template>

<script>
export default {
  name: "list-label",
  props: {
    text: String,
  },
};
</script>

<style lang="scss" scoped>
.label-box {
  width: 100%;
  display: flex;

  margin-bottom: 10px;
  label {
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 19px;
    color: #8b8b8b;
    padding-left: 20px !important;
  }
}
</style>