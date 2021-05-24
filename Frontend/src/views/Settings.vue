<template>
  <div id="page-setting" class="fullpage">
    <topNavi pageName="Settings" type="back" />
    <div class="content-page">
      <div class="setting-head wrapper">
        <div class="page-header">
          <div class="profile-pic">
            <div class="img">
              <img src="/img/default_profile.svg" v-if="user.pic == null" />
              <img :src="user.pic" v-if="user.pic == null" />
            </div>
            <div class="edit">
              <img src="/img/btn/edit.svg" />
            </div>
          </div>
          <h1 class="pagename">{{ user.firstname }} {{ user.lastname }}</h1>
          <label class="role" v-if="user.role == 'std'">Student</label>
          <label class="role" v-if="user.role == 'lec'">Lecturer</label>
          <label class="role" v-if="user.role == 'ta'">Teacher Assistant</label>
          <label class="role" v-if="user.role == null"
            >Not select role yet</label
          >
          <label class="email">{{ user.email }}</label>
        </div>
      </div>
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
      <div class="items-group" v-on:click="openOptionMenu('settings')">
        <itemSingle label="Sign Out" type="red" />
      </div>
      <div class="end-of-page"></div>
    </div>
  </div>
</template>

<script>
import itemSingle from "@/components/lists/item_single.vue";
import topNavi from "@/components/template/top_navibar.vue";
export default {
  name: "Settings",
  components: {
    topNavi,
    itemSingle,
  },
  data() {
    return {
      user: this.$store.state.user.profile,
    };
  },
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }
    this.$store.commit("Close_AllMenu");
  },
  methods: {
    openOptionMenu: function (payload) {
      this.$store.commit("Open_optionMenu", payload);
    },
  },
};
</script>

<style lang="scss" scoped>
#page-setting {
  background-color: #f6f6f6;
}

.page-header {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding: 20px 0;
  background-color: #fff;
  width: 100vw;
  border: solid;
  border-width: 0 0 1px 0;
  border-color: #ededed;
  div.profile-pic {
    width: 120px;
    height: 120px;
    position: relative;
    margin-bottom: 20px;
    z-index: 2;
    div.img {
      border-radius: 100%;
      overflow: hidden;
      width: 120px;
      height: 120px;
      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
    }
    div.edit {
      background: linear-gradient(139.07deg, #3c6697 20.27%, #1e9f13 99.96%);
      width: 30px;
      height: 30px;
      display: flex;
      justify-content: center;
      align-items: center;
      position: absolute;
      bottom: 0;
      right: 0;
      border-radius: 100%;
      div.img-edit {
        width: 13px;
        height: 13px;
        img {
          width: 100%;
          height: 100%;
          object-fit: contain;
        }
      }
    }
  }
  h1.names {
    color: #202020;
    font-size: 24px;
    line-height: 26px;
  }
  label.email,
  label.role {
    color: #8b8b8b;
    font-size: 16px;
    padding-top: 5px !important;
  }
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