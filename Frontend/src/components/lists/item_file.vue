<template>
  <div class="file-item">
    <div class="text">
      <label class="name">{{ fileName }}</label>
      <label class="link">{{ fileLink }}</label>
    </div>
    <div class="time">
      <label>{{ time }}</label>
    </div>
  </div>
</template>

<script>
export default {
  name: "file-list",
  props: {
    fileName: String,
    fileLink: String,
    time: String,
  },
};
</script>

<style lang="scss" scoped>
.file-item {
  width: 100%;
  padding: 10px 0;
  max-width: 100vw;
  display: flex;
  justify-content: space-between;
  background-color: #fff;
  .text {
    display: flex;
    align-items: flex-start;
    flex-direction: column;
    padding-left: 20px;
    .name,
    .link {
      display: -webkit-box;
      -webkit-box-orient: vertical;
      overflow: hidden;
      -webkit-box-pack: end;
      -webkit-line-clamp: 1;
    }
    .name {
      font-style: normal;
      font-weight: normal;
      font-size: 16px;
      line-height: 19px;
      color: #202020;
    }
    .link {
      margin-top: 5px !important;
      font-style: normal;
      font-weight: normal;
      font-size: 14px;
      line-height: 16px;
      color: #808080;
    }
  }
  .time {
    padding-right: 20px;
    font-style: normal;
    font-weight: 300;
    font-size: 14px;
    line-height: 16px;
    text-align: center;
    color: #c9c9c9;
  }
}
</style>