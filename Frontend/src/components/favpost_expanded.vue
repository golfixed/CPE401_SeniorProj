<template>
  <div class="card-wrapper">
    <div class="card card-a">
      <div class="subject-title">
        <label>{{ subject_code }} {{ subject_title }}</label>
      </div>
      <div class="author">
        <div class="pic">
          <img :key="pic" />
        </div>
        <div>
          <label>{{ firstName }} {{ lastName }}</label>
          <label class="message-time">{{ timeDiff }}</label>
        </div>
      </div>
      <div class="message-box">
        <p class="message">
          {{ message }}
        </p>
      </div>
    </div>
  </div>
</template>

<script>
import moment from "moment";
export default {
  name: "fav-post-expaned",
  props: {
    subject_code: String,
    subject_title: String,
    time: String,
    isSeen: Boolean,
    message: String,
    firstName: String,
    lastName: String,
    pic: String,
  },
  created: function () {},
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
    background-color: #0000004a;
    width: 100%;
    height: 20px;
    text-align: center;
  }

  div.message-box {
    padding: 15px 0;
    p.message {
      font-weight: 500;
      color: #fff;
      font-size: 16px;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
      -webkit-box-pack: end;
    }
  }

  label.message-time {
    opacity: 0.6;
    text-transform: none;
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
  width: 100%;
}
</style>