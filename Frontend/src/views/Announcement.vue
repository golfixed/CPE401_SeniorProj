<template>
  <div id="announcement-page" class="fullpage">
    <div class="card-wrapper">
      <div class="card card-a">
        <div class="subject-title">
          <label>{{ subject_code }} {{ subject_title }}</label>
        </div>
        <div class="author">
          <div class="pic">
            <img :src="profile_pic" />
          </div>
          <div class="name-time">
            <label>{{ firstName }} {{ lastName }}</label>
            <label class="message-time">{{ timeDiff }}</label>
          </div>
        </div>
        <div class="message-box">
          <p class="message">
            {{ message }}
          </p>
        </div>
        <div class="action-bar">
          <div class="btn-box">
            <div class="icons">
              <img src="/img/icons/favPostCard/reply.svg" />
            </div>
            <label class="btn-label">Reply</label>
          </div>
          <div class="btn-box">
            <div class="icons">
              <img src="/img/icons/favPostCard/bin.svg" />
            </div>
            <label class="btn-label">Delete</label>
          </div>
          <div class="btn-box" v-on:click="close()">
            <div class="icons">
              <img src="/img/icons/favPostCard/close.svg" />
            </div>
            <label class="btn-label">Close</label>
          </div>
        </div>
      </div>
    </div>
    <div class="back-bg" @click="$router.go(-1)"></div>
  </div>
</template>

<script>
import moment from "moment";
export default {
  name: "AnnouncementPage",
  data: function () {
    return {
      firstName: "Bhaksiree",
      lastName: "Tongtago",
      profile_pic: "/img/mockup/profile_volk.png",
      time: "Jan 15 2021 10:23:25",
      subject_code: "CPE 401",
      subject_title: "Senior Project I",
      isSeen: false,
      message:
        "There will be no class this week. Make-up class date will be annouce later.Your lab exercise score and quiz test score will be announced through LEB2, please check it out later.",
    };
  },
  computed: {
    timeDiff(date) {
      var post_time = this.time;
      var then = moment(post_time, "MMM DD YYYY hh:mm:ss");
      return then.fromNow();
    },
  },
};
</script>

<style lang="scss" scoped>
#announcement-page {
  display: flex;
  justify-content: center;
  align-items: center;
}
.back-bg {
  background-color: #fff;
  position: fixed;
  height: 100vh;
  width: 100vw;
  top: 0;
  left: 0;
  z-index: 20;
}
.action-bar {
  display: flex;
  justify-content: center;
  align-items: center;
  margin: 0 15px -15px -15px !important;
  padding: 15px !important;
  background-color: #00000018;
  width: 100%;
  .btn-box {
    width: 33.33%;
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    .icons {
      width: 25px;
      height: 25px;
      margin-bottom: 10px;
      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
    }
    label.btn-label {
      font-size: 12px;
    }
  }
}
.card-a {
  flex: 0 0 auto;
  height: fit-content;
  display: block;
  padding: 15px;
  background: linear-gradient(135deg, #3c6697 0%, #3b9b50 100%);

  label {
    color: #fff;
    font-size: 12px;

    text-transform: uppercase;
  }
  div.subject-title {
    margin: -15px 15px 0 -15px !important;
    padding: 15px !important;
    background-color: #00000018;
    width: 100%;
    // height: 20px;
    text-align: center;
    display: flex;
    justify-content: center;
    align-items: center;
  }

  div.message-box {
    padding: 15px 0;
    p.message {
      font-weight: 500;
      color: #fff;
      font-size: 16px;
      text-align: left;
    }
  }

  label.message-time {
    opacity: 0.6;
    text-transform: none;
  }
  .author {
    display: flex;
    padding-top: 15px;
    div.pic {
      height: 34px;
      width: 34px;
      border-radius: 100px;
      overflow: hidden;
      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
    }
    div.name-time {
      padding-left: 10px;
      display: flex;
      flex-direction: column;
      justify-content: center;
    }
  }
}
//Misc Styles
.card {
  box-shadow: 0px 2px 10px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
  overflow: hidden;
}
.card-wrapper {
  padding: 20px;
  z-index: 21;
  margin-top: -80px;
}
</style>