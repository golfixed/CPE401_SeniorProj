<template>
  <div id="page-home" class="app-default-border-gray-top">
    <div class="page-content-none" v-if="recentAct.length == 0">
      <div class="no-msg">
        <label class="title">Nothing Going On Here</label>
        <label class="desc"
          >To join classrooms and start a new discussion, <br />
          tap the plus botton at buttom right.</label
        >
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Home-Page",

  data: function () {
    return {
      recentAct: [],
    };
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
