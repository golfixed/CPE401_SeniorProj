<template>
  <div id="setting-page" class="fullpage">
    <topNavi pageName="Profile Settings" type="back" />
    <div class="content-page">
      <div class="items-group">
        <itemInput
          label="Firstname"
          type="textbox"
          :preInfo="user.firstName"
          name="firstname"
        />
        <itemInput
          label="Lastname"
          type="textbox"
          :preInfo="user.lastName"
          name="lastname"
        />
        <itemSelect
          label="Gender"
          type="sex"
          typeSelect="gender"
          :preInfo="user.sex"
          name="gender"
        />
        <itemSelect
          label="User role"
          type="role"
          typeSelect="gender"
          :preInfo="user.sex"
          name="gender"
        />
      </div>
      <div class="items-group">
        <itemSingle label="Save" type="green" />
      </div>
    </div>
  </div>
</template>

<script>
import itemSelect from "@/components/lists/item_select.vue";
import itemInput from "@/components/lists/item_input.vue";
import itemSingle from "@/components/lists/item_single.vue";
import topNavi from "@/components/template/top_navibar.vue";
export default {
  name: "Settings-Profile",
  components: {
    topNavi,
    itemInput,
    itemSingle,
    itemSelect,
  },
  data() {
    return {
      user: this.$store.state.user.profile,
      updatedInfo: {
        firstname: "user not found",
        lastname: "user not found",
      },
    };
  },
  methods: {
    updateInfo: function () {
      //comment
    },
  },
};
</script>

<style lang="scss" scoped>
#setting-page {
  background-color: #f6f6f6;
}
.wrapper {
  padding: 0 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>