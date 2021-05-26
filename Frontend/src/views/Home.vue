<template>
  <div id="page-home" class="app-default-border-gray-top">
    <div class="page-content-none" v-if="recentAct.length == 0">
      <div class="no-msg">
        <img class="icon" src="/img/icons/home_blank.svg" draggable="false" />
        <label class="title">Nothing Going On Here</label>
        <label class="desc"
          >Join a class and start new conversations. <br />Tap Classrooms tab to
          join class.</label
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
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }
  },
  created: function () {},
  methods: {
    openSearchPage: function () {
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
