<template>
  <div class="page-loading">
    <div class="box">
      <pulse-loader
        :loading="loading"
        :color="color"
        :size="size"
      ></pulse-loader>
      <label>{{ label }}</label>
    </div>
  </div>
</template>

<script>
import PulseLoader from "vue-spinner/src/PulseLoader.vue";
export default {
  name: "Page-Loading",
  props: {
    loading: String,
    color: String,
    size: String,
    label: String,
  },
  components: {
    PulseLoader,
  },
};
</script>

<style lang="scss" scoped>
.page-loading {
  width: 100%;
  height: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  .box {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    label {
      font-size: 16px;
      font-weight: 500;
      margin-top: 10px !important;
      color: #505050;
    }
  }
}
</style>