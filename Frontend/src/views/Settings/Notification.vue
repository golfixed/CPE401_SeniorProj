<template>
  <div id="setting-page" class="fullpage">
    <topNavi pageName="Notification Settings" type="back" />
    <div class="content-page">
      <div class="items-group">
        <itemSelect
          label="Classroom Notification"
          type="class"
          :preInfo="user.setting.noti.class"
          name="noti_class"
        />
        <itemSelect
          label="Chat Notification"
          type="noti"
          :preInfo="user.setting.noti.chat"
          name="noti_chat"
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