<template>
  <div id="setting-page" class="fullpage">
    <topNavi type="login" />
    <div class="content-page">
      <div class="wrapper">
        <div class="page-header">
          <div class="profile-pic">
            <div class="img">
              <img :src="user.pic" />
            </div>
            <div class="edit">
              <img src="/img/btn/edit.svg" />
            </div>
          </div>
          <h1 class="pagename">{{ user.firstName }} {{ user.lastName }}</h1>
          <label class="role" v-if="user.role == 'std'">Student</label>
          <label class="role" v-if="user.role == 'lec'">Lecturer</label>
          <label class="role" v-if="user.role == 'ta'"
            >Lecturer Assistant</label
          >
          <label class="email">{{ user.email }}</label>
        </div>
      </div>
      <div class="items-group">
        <itemSingle
          text="Profile Settings"
          desc="Display name, Gender, User roles"
          type="normal"
        />
        <itemSingle
          text="Account Settings"
          desc="E-mail, Password, Deactivation"
          type="normal"
        />
        <itemSingle
          text="Notifications"
          desc="Chat notification, Group notification"
          type="normal"
        />
      </div>
      <div class="items-group">
        <itemSingle text="Feedback" type="normal" />
        <itemSingle text="Support & Contact Us" type="normal" />
      </div>
      <div class="items-group">
        <itemSingle text="Sign Out" type="center" />
      </div>
    </div>
  </div>
</template>

<script>
import itemSingle from "@/components/lists/item_single.vue";
import topNavi from "@/components/template/topNavi.vue";
export default {
  name: "Login",
  components: {
    topNavi,
    itemSingle,
  },
  data() {
    return {
      user: this.$store.state.user.profile,
    };
  },
  methods: {
    signin: function () {
      this.$store.commit("LogIn");
    },
  },
};
</script>

<style lang="scss" scoped>
#setting-page {
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
.sign-in {
  background-color: #479f60;
  label {
    color: #fff;
  }
}
.sign-in:active {
  background-color: #45945b;
}
.header {
  height: 250px;
  display: flex;
  justify-content: flex-end;
  align-items: center;
  flex-direction: column;
  padding-bottom: 20px;
  .logo {
    width: 120px;
    height: 120px;
    transform: translate(10px, 0);
    img {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }
  }
  h1 {
    color: #202020;
    font-size: 24px;
    padding-top: 20px !important;
  }
  h3 {
    color: #8b8b8b;
    font-size: 14px;
    font-weight: 500;
    padding-top: 5px !important;
  }
}

.bottom-sec {
  position: fixed;
  bottom: 0;
  left: 0;
  width: 100vw;
  padding: 20px 0 30px 0;

  label.bottom-label {
    width: 100%;
    padding-top: 20px !important;
    text-align: center;
    color: #505050;
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 19px;
    margin-bottom: 10px !important;
    border: 1px solid #ededed;
    border-width: 1px 0 0 0;
  }
  label.sign-up {
    color: #479f60;
    font-weight: 700;
  }
}
.wrapper {
  padding: 0 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
</style>