<template>
  <div class="card-wrapper">
    <div class="card card-a">
      <label>{{ subject_code }} {{ subject_title }}</label>
      <div class="message-box">
        <p class="message">
          {{ message }}
        </p>
      </div>
      <label class="message-time">{{ timeDiff }}</label>
    </div>
  </div>
</template>

<script>
import moment from "moment";
export default {
  name: "announcement-card",
  props: {
    subject_code: String,
    subject_title: String,
    time: String,
    isSeen: Boolean,
    message: String,
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
  width: 250px;
  height: fit-content;
  display: block;
  padding: 15px;
  background: linear-gradient(135deg, #3c6697 0%, #3b9b50 100%);

  label {
    color: #fff;
    font-size: 12px;
    display: -webkit-box;
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    overflow: hidden;
    -webkit-box-pack: end;
    text-transform: uppercase;
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
</style>