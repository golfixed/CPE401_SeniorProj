<template>
  <div class="">
    <div class="items-group" v-if="teacherList.length > 0">
      <LabelItemGroup text="Class Instructor" />
      <itemContact
        v-for="item in teacherList"
        :key="item.id"
        v-bind:id="item.id"
        v-bind:account_id="item.account_id"
        v-bind:fname="item.firstname"
        v-bind:lname="item.lastname"
        v-bind:pictureURL="item.image"
      />
    </div>
    <div class="items-group" v-if="studentList.length > 0">
      <LabelItemGroup text="Students" />
      <itemContact
        v-for="item in studentList"
        :key="item.id"
        v-bind:id="item.id"
        v-bind:account_id="item.account_id"
        v-bind:fname="item.firstname"
        v-bind:lname="item.lastname"
        v-bind:pictureURL="item.image"
      />
    </div>
    <div class="end-of-page"></div>
  </div>
</template>

<script>
import LabelItemGroup from "@/components/labels/label_item_group.vue";
import itemContact from "@/components/lists/item_contact.vue";
import topNavi from "@/components/template/top_navibar.vue";
import axios from "@/axios.js";
export default {
  name: "ClassMember-Page",
  components: {
    topNavi,
    itemContact,
    LabelItemGroup,
  },
  data() {
    return {
      memberList: [],
      studentList: [],
      teacherList: [],
    };
  },
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }
    var path = this.$route.path;
    var id = path.replace("/classrooms/", "");
    this.class_id = parseInt(id);
    console.log("class_id: " + this.class_id);
    this.fetchMemberList(this.class_id);
  },
  methods: {
    openOptionMenu: function () {
      this.$store.commit("Open_optionMenu");
    },
    fetchMemberList(id) {
      axios.post("/classmember", { class_id: id }).then((res) => {
        if (res.data.false != true) {
          console.log("class member list:");
          console.log(res);

          this.memberList = res.data.data;
          if (this.memberList.length > 0) {
            this.studentList = this.memberList.filter(
              (memberList) => memberList.role == "std"
            );
            this.teacherList = this.memberList.filter(
              (memberList) => memberList.role == "tea"
            );
          }
        }
      });
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