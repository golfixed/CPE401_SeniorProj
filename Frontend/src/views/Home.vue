<template>
  <div id="page-home" class="app-page app-default-border-gray-top">
    <!-- <hr class="page-hr" /> -->
    <div class="section" style="padding-top: 20px; height: fit-content">
      <h2 style="font-size: 20px">Current screen resolution:</h2>
      <h4 style="font-size: 30px; color: green">
        {{ screenwidth }} × {{ screenheight }}
      </h4>
    </div>
  </div>
</template>

<script>
export default {
  name: "Home",

  data: function () {
    return {};
  },
  created: function () {},
  methods: {
    openSearchPage: function () {
      console.log("clicked");
      this.$store.commit("Open_searchPage");
    },
  },
  computed: {
    screenheight: function () {
      return window.innerHeight;
    },
    screenwidth: function () {
      return window.innerWidth;
    },
  },
};
</script>
<style lang="scss" scoped>
</style>
