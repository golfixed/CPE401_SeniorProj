<template>
  <div id="page-classrooms">
    <div class="page-content-none" v-if="classList.length == 0">
      <div class="no-msg">
        <img class="icon" src="/img/icons/home_blank.svg" draggable="false" />
        <label class="title">Nothing Going On Here</label>
        <label class="desc"
          >Join a class and start new conversations. <br />Tap Classrooms tab to
          join class.</label
        >
      </div>
    </div>
    <div class="page-list-wrapper" v-if="classList.length > 0">
      <div class="class-item-wrapper">
        <classItem
          v-for="item in classList"
          :key="item.id"
          v-if="item.isPinned == false"
          v-bind:id="item.id"
          v-bind:code="item.code"
          v-bind:title="item.title"
          v-bind:section="item.section"
          v-bind:prevMember="item.prevMember"
        />
        <div class="end-of-page"></div>
      </div>
    </div>
  </div>
</template>

<script>
import classItem from "@/components/lists/item_class.vue";

export default {
  name: "Classrooms-Page",
  components: { classItem },
  data: function () {
    return {
      classList: [
        {
          id: 0,
          code: "CPE100",
          title: "Basic Computer Programming I",
          section: 2,
          pictureURL: "/img/mockup/class.png",
          isPinned: true,
          prevMember: [
            {
              id: 0,
              pictureURL: "/img/mockup/profile.png",
            },
            {
              id: 1,
              pictureURL: "/img/mockup/profile_volk.png",
            },
            {
              id: 2,
              pictureURL: "/img/mockup/profile_my.png",
            },
          ],
        },
        {
          id: 1,
          code: "CPE100",
          title: "Basic Computer Programming I",
          section: 2,
          pictureURL: "/img/mockup/class.png",
          isPinned: false,
          prevMember: [
            {
              id: 0,
              pictureURL: "/img/mockup/profile.png",
            },
            {
              id: 1,
              pictureURL: "/img/mockup/profile_volk.png",
            },
            {
              id: 2,
              pictureURL: "/img/mockup/profile_my.png",
            },
          ],
        },
        {
          id: 2,
          code: "CPE100",
          title: "Basic Computer Programming I",
          section: 2,
          pictureURL: "/img/mockup/class.png",
          isPinned: false,
          prevMember: [
            {
              id: 0,
              pictureURL: "/img/mockup/profile.png",
            },
            {
              id: 1,
              pictureURL: "/img/mockup/profile_volk.png",
            },
            {
              id: 2,
              pictureURL: "/img/mockup/profile_my.png",
            },
          ],
        },
        {
          id: 3,
          code: "CPE100",
          title: "Basic Computer Programming I",
          section: 2,
          pictureURL: "/img/mockup/class.png",
          isPinned: false,
          prevMember: [
            {
              id: 0,
              pictureURL: "/img/mockup/profile.png",
            },
            {
              id: 1,
              pictureURL: "/img/mockup/profile_volk.png",
            },
            {
              id: 2,
              pictureURL: "/img/mockup/profile_my.png",
            },
          ],
        },
      ],
    };
  },
  mounted() {
    if (!localStorage.token && !localStorage.user) {
      this.$router.push({ path: "/" });
    }
    this.$store.commit("Close_AllMenu");
  },
  created: function () {},
  methods: {},
  computed: {},
};
</script>
<style lang="scss" scoped>
#page-classrooms {
  background-color: #f6f6f6;
}
.class-item-wrapper {
  padding: 0 20px;
}
</style>
