<template>
  <router-link to="">
    <div class="card-wrapper">
      <div class="card card-a">
        <label class="code">{{ subject_code }}</label>
        <label class="title"> {{ subject_title }}</label>
        <label class="section">Section {{ section }}</label>
        <div class="prev-member-box">
          <div class="member-item">
            <label class="more-num">+{{ prevMember.length }}</label>
          </div>
          <div class="member-item" v-for="item in prevMember" :key="item.id">
            <img :src="item.pictureURL" />
          </div>
        </div>
      </div>
    </div>
  </router-link>
</template>

<script>
import moment from "moment";
export default {
  name: "fav-post",
  props: {
    subject_code: String,
    subject_title: String,
    section: Number,
    prevMember: Array,
  },
  created: function () {},
  computed: {},
  methods: {},
  mounted() {},
  data() {
    return {};
  },
};
</script>

<style lang="scss" scoped>
.card-a {
  flex: 0 0 auto;
  width: 120px;
  height: fit-content;
  display: block;
  padding: 15px;
  background: linear-gradient(135deg, #3c6697 0%, #3b9b50 100%);

  label {
    color: #fff;
    font-size: 12px;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    -webkit-box-pack: end;
  }
  .code {
    font-style: normal;
    font-weight: bold;
    font-size: 18px;
    line-height: 21px;
    margin-bottom: 5px !important;
    text-transform: uppercase;
  }
  .title {
    font-style: normal;
    font-weight: 600;
    font-size: 14px;
    line-height: 16px;
    margin-bottom: 15px !important;
  }
  .section {
    font-style: normal;
    font-weight: normal;
    font-size: 14px;
    line-height: 16px;
    margin-bottom: 15px !important;
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
  // -webkit-box-shadow: 0px 2px 10px 0px rgba(0, 0, 0, 0.1);
  // -moz-box-shadow: 0px 2px 10px 0px rgba(0, 0, 0, 0.1);
  // box-shadow: 0px 2px 10px 0px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
}
.card-wrapper {
  padding: 0 5px;
}
.card-wrapper:first-child {
  padding-left: 0px;
}
.card-wrapper:last-child {
  padding-right: 10px;
}
.prev-member-box {
  display: flex;
  justify-content: flex-end;
  align-items: center;
  flex-direction: row-reverse;
  padding-left: 10px;
  .member-item {
    width: 34px;
    height: 34px;
    overflow: hidden;
    border-radius: 100%;
    margin-left: -10px;
    img {
      width: 100%;
      height: 100%;
      object-fit: contain;
    }
    .more-num {
      width: 100%;
      height: 100%;
      background: #ededed;
      display: flex;
      justify-content: center;
      align-items: center;
      font-style: normal;
      font-weight: normal;
      font-size: 14px;
      line-height: 16px;
      text-align: center;
      color: #c9c9c9;
    }
  }
}
</style>