<template>
  <div class="card-wrapper">
    <div class="card card-a">
      <label>CPE 401 Senior Project I</label>
      <div class="message-box">
        <p class="message">
          There will be no class this week. Make-up class date will be annouce
          later.Your lab exercise score and quiz test score will be announced
          through LEB2, please check it out later.
        </p>
      </div>
      <label class="time">{{ timeDiff }}</label>
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
    time: Date,
    isSeen: Boolean,
    message: String,
  },
  created: function () {},
  computed: {
    timeDiff(date) {
      var then = moment([2020, 20, 17]);
      var now = moment(date);
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

  label.time {
    opacity: 0.6;
  }
}
</style>