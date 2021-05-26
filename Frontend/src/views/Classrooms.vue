<template>
  <div id="page-classrooms">
    <div
      class="page-content-none"
      v-if="classList.length == 0 && isOffline == false"
    >
      <div class="no-msg">
        <img class="icon" src="/img/icons/home_blank.svg" draggable="false" />
        <label class="title">You are not in classroom yet.</label>
        <label class="desc" v-if="this.$store.state.user.profile.role == 'std'"
          >Tap bottom right button to join classroom.</label
        >
        <label class="desc" v-if="this.$store.state.user.profile.role == 'tea'"
          >Tap bottom right button to join or create classroom.</label
        >
      </div>
    </div>
    <div class="page-content-none" v-if="isOffline == true">
      <div class="no-msg">
        <img class="icon" src="/img/icons/nointernet.svg" draggable="false" />
        <label class="title">You're offline</label>
        <label class="desc">Please check your internet connection. </label>
      </div>
    </div>
    <div id="section-favbar" v-if="classList.length > 0">
      <div id="pinned-bar" class="section app-default-pinnedbar">
        <div class="pin-title">
          <label>Pinned Classrooms</label>
        </div>
        <div class="pin-tray-wrap">
          <div class="slide-tray">
            <favClass
              v-for="item in classList"
              :key="item.id"
              v-bind:id="item.id"
              v-bind:subject_code="item.class_code"
              v-bind:subject_title="item.class_name"
              v-bind:section="item.section"
              v-bind:pic="item.class_pic"
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
          :key="item.class_id"
          v-bind:id="item.id"
          v-bind:code="item.class_code"
          v-bind:title="item.class_name"
          v-bind:section="item.section"
          v-bind:pic="item.class_pic"
        />
        <div class="end-of-page"></div>
      </div>
    </div>
  </div>
</template>

<script>
import classItem from "@/components/lists/item_class.vue";
import favClass from "@/components/fav_class.vue";
import axios from "@/axios.js";

export default {
  name: "Classrooms-Page",
  components: { classItem, favClass },
  data: function () {
    return {
      classList: [],
      isLoading: false,
      classListPinned: [],
      isOffline: true,
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
      var class_id = this.$store.state.user.profile.id;
      // console.log(class_id);
      axios.post("/classrooms", { id: class_id }).then((res) => {
        // console.log(res);
        this.isOffline = false;
        if (res.error != true) {
          // console.log("Classrooms: class list fetched");
          console.log(res);
          this.classList = res.data.data;
          this.classList = this.classList.filter(
            (classList) => classList.favorite == false
          );
          this.classListPinned = this.classList.filter(
            (classList) => classList.favorite == true
          );
          // console.log(this.classList);
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
  // padding-top: 15px;
}
</style>
