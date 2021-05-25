<template>
  <div>
    <div class="items-group">
      <LabelMaterial text="Labsheet Week 4" />
      <itemFile
        v-for="item in memberList"
        :key="item.id"
        v-if="item.role == 'tea'"
        v-bind:fname="item.fname"
        v-bind:lname="item.lname"
        v-bind:pictureURL="item.pictureURL"
      />
    </div>
    <div class="items-group">
      <LabelMaterial text="Course Syllabus" />
      <itemFile
        v-for="item in memberList"
        :key="item.id"
        v-if="item.role == 'std'"
        v-bind:fname="item.fname"
        v-bind:lname="item.lname"
        v-bind:pictureURL="item.pictureURL"
      />
    </div>
    <div class="end-of-page"></div>
  </div>
</template>

<script>
import LabelMaterial from "@/components/labels/label_item_material.vue";
import itemFile from "@/components/lists/item_contact.vue";
export default {
  name: "ClassMember-Page",
  components: {
    itemFile,
    LabelMaterial,
  },
  data() {
    return {
      user: this.$store.state.user.profile,
      memberList: [
        {
          id: 1,
          pictureURL: "/img/mockup/profile.png",
          fname: "Peerapong",
          lname: "Thammakaew",
          role: "std",
        },
        {
          id: 2,
          pictureURL: "/img/mockup/profile_volk.png",
          fname: "Bhaksiree",
          lname: "Tongtago",
          role: "std",
        },
        {
          id: 3,
          pictureURL: "/img/mockup/profile_my.png",
          fname: "Nithi",
          lname: "My",
          role: "tea",
        },
        {
          id: 4,
          pictureURL: "/img/mockup/profile_my.png",
          fname: "Nithi",
          lname: "MY",
          role: "std",
        },
        {
          id: 5,
          pictureURL: "/img/mockup/profile.png",
          fname: "Bhaksiree",
          lname: "Wangviboonkij",
          role: "std",
        },
        {
          id: 6,
          pictureURL: "/img/mockup/profile.png",
          fname: "Bhaksiree",
          lname: "Wangviboonkij",
          role: "std",
        },
        {
          id: 7,
          pictureURL: "/img/mockup/profile.png",
          fname: "Bhaksiree",
          lname: "Wangviboonkij",
          role: "ta",
        },
        {
          id: 8,
          pictureURL: "/img/mockup/profile.png",
          fname: "Bhaksiree",
          lname: "Wangviboonkij",
          role: "std",
        },
        {
          id: 9,
          pictureURL: "/img/mockup/profile.png",
          fname: "Bhaksiree",
          lname: "Wangviboonkij",
          role: "ta",
        },
        {
          id: 10,
          pictureURL: "/img/mockup/profile.png",
          fname: "Bhaksiree",
          lname: "Wangviboonkij",
          role: "tea",
        },
      ],
    };
  },
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }
  },
  methods: {
    openOptionMenu: function () {
      this.$store.commit("Open_optionMenu");
    },
  },
};
</script>

<style lang="scss" scoped>
#page-setting {
  background-color: #f6f6f6;
}
.items-group {
  background-color: #f6f6f6;
}
input {
  margin-bottom: 10px;
}
.btn-wrapper {
  width: 100%;
  margin: 20px 0;
}

.wrapper {
  padding: 0 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>