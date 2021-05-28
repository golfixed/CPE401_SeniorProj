<template>
  <div class="center-btn-wrapper">
    <div class="assist-btn" v-on:click="openAssistModal()">
      <div class="btn-img">
        <img src="/img/btn/plus.svg" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Center-tab-btn",
  components: {},
  methods: {
    openAssistModal: function () {
      this.$store.commit("Open_assistMenu");
    },
  },
  computed: {
    currentPage: function () {
      return this.$route.path;
    },
  },
};
</script>

<style lang="scss" scoped>
.center-btn-wrapper {
  z-index: 11;
  width: 66px;
  height: 66px;
  margin-top: -40px;
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