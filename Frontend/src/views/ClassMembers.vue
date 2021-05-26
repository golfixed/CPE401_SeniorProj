<template>
  <div class="">
    <div class="items-group">
      <LabelItemGroup text="Class Instructor" />
      <itemContact
        v-for="item in teacherList"
        :key="item.id"
        v-bind:id="item.id"
        v-bind:fname="item.fname"
        v-bind:lname="item.lname"
        v-bind:pictureURL="item.pictureURL"
      />
    </div>
    <!-- <div class="items-group">
      <LabelItemGroup text="Teacher Assistant" />
      <itemContact
        v-for="item in memberList"
        :key="item.id"
        v-if="item.role == 'ta'"
        v-bind:fname="item.fname"
        v-bind:lname="item.lname"
        v-bind:pictureURL="item.pictureURL"
      />
    </div> -->
    <div class="items-group">
      <LabelItemGroup text="Students" />
      <itemContact
        v-for="item in studentList"
        :key="item.id"
        v-bind:id="item.id"
        v-bind:fname="item.fname"
        v-bind:lname="item.lname"
        v-bind:pictureURL="item.pictureURL"
      />
    </div>
    <div class="end-of-page"></div>
  </div>
</template>

<script>
import LabelItemGroup from "@/components/labels/label_item_group.vue";
import itemContact from "@/components/lists/item_contact.vue";
import topNavi from "@/components/template/top_navibar.vue";
export default {
  name: "ClassMember-Page",
  components: {
    topNavi,
    itemContact,
    LabelItemGroup,
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
      studentList: [],
      teacherList: [],
    };
  },
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }
    if (this.memberList) {
      this.studentList = this.memberList.filter(
        (memberList) => memberList.role == "std"
      );
      this.teacherList = this.memberList.filter(
        (memberList) => memberList.role == "tea"
      );
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