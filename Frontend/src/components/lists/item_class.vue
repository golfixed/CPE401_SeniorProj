<template>
  <div class="class-item">
    <div class="text-box">
      <label class="code">{{ code }}</label>
      <label class="title">{{ title }}</label>
      <label class="section">Section {{ section }}</label>
    </div>
    <div class="img-box">
      <div class="member-item">
        <label class="more-num">+{{ prevPic.length }}</label>
      </div>
      <div class="member-item" v-for="item in prevPic" :key="item.id">
        <img :src="item.pictureURL" />
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "class-list",
  props: {
    code: String,
    title: String,
    section: Number,
    prevMember: Array,
  },
  data: function () {
    return {
      prevPic: [{}],
    };
  },
  mounted() {
    this.prevPic = this.prevMember.reverse();
  },
};
</script>

<style lang="scss" scoped>
.class-item {
  display: grid;
  grid-template-columns: calc(100% - 110px) 110px;
  padding: 15px 0;
  border: 1px solid #ededed;
  border-width: 0 0 1px 0;
  .text-box {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
    padding-right: 20px;
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
</style>