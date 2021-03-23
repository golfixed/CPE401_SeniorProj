<template>
  <div class="card-wrapper">
    <div class="card card-a">
      <div class="subject-title">
        <label>{{ subject_code }} {{ subject_title }}</label>
      </div>
      <div class="author">
        <div class="pic">
          <img :src="pic" />
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
  methods: {
    close: function () {
      this.$emit("closeFavPost");
    },
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
}
</style>