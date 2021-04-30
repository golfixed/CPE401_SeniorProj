<template>
  <div id="page-setting" class="fullpage">
    <topNavi pageName="Notifications" />
    <div class="content-page">
      <div class="items-group">
        <router-link to="/settings/profile">
          <itemSingle
            label="Profile Settings"
            desc="Display name, Gender, User roles"
            type="normal"
          />
        </router-link>
        <router-link to="/settings/account">
          <itemSingle
            label="Account Settings"
            desc="E-mail, Password, Deactivation"
            type="normal"
          />
        </router-link>
        <router-link to="/settings/notification">
          <itemSingle
            label="Notifications"
            desc="Chat notification, Group notification"
            type="normal"
          />
        </router-link>
      </div>
      <div class="items-group">
        <itemSingle label="Feedback" type="normal" />
        <itemSingle label="Support & Contact Us" type="normal" />
      </div>
      <div class="items-group">
        <itemSingle label="Sign Out" type="red" />
      </div>
      <div class="end-of-page"></div>
    </div>
  </div>
</template>

<script>
import topNavi from "@/components/template/topNavi.vue";
export default {
  name: "Notification",
  components: {
    topNavi,
  },
  data() {
    return {
      user: this.$store.state.user.profile,
    };
  },
  methods: {},
};
</script>

<style lang="scss" scoped>
#page-setting {
  background-color: #f6f6f6;
}

input {
  margin-bottom: 10px;
}
.btn-wrapper {
  width: 100%;
  margin: 20px 0;
}
.sign-in {
  background-color: #479f60;
  label {
    color: #fff;
  }
}
.sign-in:active {
  background-color: #45945b;
}
.wrapper {
  padding: 0 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>