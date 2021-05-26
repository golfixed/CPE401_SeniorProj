<template>
  <div class="label-form">
    <label class="text">{{ text }}</label>
    <label class="opt" v-if="optional == true">(optional)</label>
  </div>
</template>

<script>
export default {
  name: "list-label",
  props: {
    text: String,
    optional: Boolean,
  },
};
</script>

<style lang="scss" scoped>
.label-form {
  width: 100%;
  display: flex;
  margin-bottom: 10px;
  label.text {
    font-style: normal;
    font-weight: bold;
    font-size: 16px;
    line-height: 19px;
    color: #505050;
    margin-right: 5px !important;
  }
  label.opt {
    font-style: normal;
    font-weight: normal;
    font-size: 14px;
    line-height: 19px;
    color: #8b8b8b;
  }
}
</style>