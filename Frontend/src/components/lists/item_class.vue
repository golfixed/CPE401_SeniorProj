<template>
  <div class="class-item" v-on:click="openClassroom(id)">
    <div class="class-img">
      <img :src="img" v-if="img" />
      <img src="/img/classrooms/green.jpg" v-if="!img" />
      <!-- <img :src="img" v-if="img" />
      <label v-if="!img">{{ previewLetter }}</label> -->
    </div>
    <div class="text-box">
      <label class="code">{{ code }}</label>
      <label class="title">{{ title }}</label>
      <label class="section">Section {{ section }}</label>
    </div>
    <!-- <div class="img-box">
      <div class="member-item">
        <label class="more-num">+{{ prevPic.length }}</label>
      </div>
      <div class="member-item" v-for="item in prevPic" :key="item.id">
        <img :src="item.pictureURL" />
      </div>
    </div> -->
  </div>
</template>

<script>
import axios from "@/axios.js";
export default {
  name: "class-list",
  props: {
    id: Number,
    code: String,
    title: String,
    section: String,
    img: Array,
  },
  data: function () {
    return {
      previewLetter: "",
      // prevPic: [{}],
      // link: "",
    };
  },
  mounted() {
    // if (this.prevMember) this.prevPic = this.prevMember;
    this.previewLetter = this.title.charAt(0);
  },
  methods: {
    openClassroom(id) {
      this.$router.push("/classrooms/" + id);
    },
  },
};
</script>

<style lang="scss" scoped>
.class-item {
  display: grid;
  grid-template-columns: 64px auto;
  padding: 15px 0;
  border: 1px solid #ededed;
  border-width: 0 0 1px 0;
  // padding: 15px;
  // background: #ffffff;
  // box-shadow: 0px 0px 10px 2px rgb(0 0 0 / 10%);
  // border-radius: 10px;
  // margin-bottom: 15px;
  .text-box {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
    padding-left: 15px;
    .code {
      font-style: normal;
      font-weight: bold;
      font-size: 16px;
      line-height: 19px;
      color: #202020;
      margin-bottom: 5px !important;
    }
    .title {
      font-style: normal;
      font-weight: normal;
      font-size: 16px;
      line-height: 19px;
      color: #505050;
      margin-bottom: 5px !important;
      display: -webkit-box;
      -webkit-line-clamp: 1;
      -webkit-box-orient: vertical;
      overflow: hidden;
      -webkit-box-pack: end;
    }
    .section {
      font-style: normal;
      font-weight: normal;
      font-size: 14px;
      line-height: 16px;
      color: #8b8b8b;
    }
  }
}
.img-box {
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
.class-img {
  width: 64px;
  height: 64px;
  overflow: hidden;
  border-radius: 10px;
  // background: linear-gradient(139.07deg, #3c6697 20.27%, #1e9f13 99.96%);
  display: flex;
  justify-content: center;
  align-items: center;
  box-shadow: 0px 5px 25px 4px rgb(0 0 0 / 7%);
  img {
    width: 64px;
    height: 64px;
    object-fit: cover;
  }
  label {
    font-size: 54px;
    text-align: center;
    font-weight: 600;
    // color: #fff;
  }
}
</style>