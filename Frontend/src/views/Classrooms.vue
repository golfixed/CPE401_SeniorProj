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
    <div id="section-favbar" v-if="classListPinned.length > 0">
      <div
        id="pinned-bar"
        class="section app-default-pinnedbar app-default-border-gray"
      >
        <div class="pin-title">
          <label>Pinned Classrooms</label>
        </div>
        <div class="pin-tray-wrap">
          <div class="slide-tray">
            <favClass
              v-for="item in classListPinned"
              :key="item.id"
              v-bind:id="item.id"
              v-bind:subject_code="item.class_code"
              v-bind:subject_title="item.class_name"
              v-bind:section="item.section"
              v-bind:prevMember="item.prevMember"
            />
          </div>
        </div>
      </div>
    </div>
    <div class="page-list-wrapper" v-if="classList.length > 0">
      <div class="pin-title-classrooms">
        <label>All Classrooms</label>
      </div>
      <div class="class-item-wrapper">
        <classItem
          v-for="item in classList"
          :key="item.id"
          v-if="item.favorite == false"
          v-bind:id="item.id"
          v-bind:code="item.class_code"
          v-bind:title="item.class_name"
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
import favClass from "@/components/favClass.vue";
import axios from "@/axios.js";

export default {
  name: "Classrooms-Page",
  components: { classItem, favClass },
  data: function () {
    return {
      classListMockUp: [
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
      classList: [],
      isLoading: false,
      classListPinned: [],
    };
  },
  mounted() {
    if (!localStorage.token && !localStorage.user) {
      this.$router.push({ path: "/" });
    }
    this.$store.commit("Close_AllMenu");
    this.fetchClassList();
  },
  created: function () {},
  methods: {
    fetchClassList: function () {
      this.isLoading = true;
      axios.get("/classrooms").then((res) => {
        if (res.error != true) {
          console.log("Classrooms: class list fetched");
          this.classList = res.data.data;
          this.classListPinned = this.classList.filter(
            (classList) => classList.favorite == true
          );
        } else {
          console.log("Classrooms: class list fetch failed");
        }
      });
      setTimeout(
        function () {
          this.isLoading = false;
        }.bind(this),
        2000
      );
    },
  },
  computed: {},
};
</script>
<style lang="scss" scoped>
// #page-classrooms {
//   background-color: #f6f6f6;
// }
.class-item-wrapper {
  padding: 0 20px;
}
.pin-title-classrooms {
  font-size: 16px;
  color: #8b8b8b;
  font-weight: 400;
  margin: 0 15px 0 20px;
  padding-top: 15px;
}
</style>
