<template>
  <div id="page-setting" class="fullpage">
    <topNavi pageName="Notifications" type="back" />
    <div class="content-page">
      <div
        class="page-content-none page-content-none-fullpage"
        v-if="notiList.length == 0"
      >
        <div class="no-msg">
          <img class="icon" src="/img/icons/noti_bell.svg" draggable="false" />
          <label class="title">No New Notification</label>
          <label class="desc">Be back later.</label>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import topNavi from "@/components/template/top_navibar.vue";
export default {
  name: "Notification",
  components: {
    topNavi,
  },
  data() {
    return {
      user: this.$store.state.user.profile,
      notiList: [],
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