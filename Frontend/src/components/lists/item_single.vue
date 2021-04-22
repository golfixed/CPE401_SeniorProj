<template>
  <div class="item">
    <label class="item-name" v-if="typeCal == 'normal'">{{ text }}</label>
    <label
      class="item-name item-name-red item-name-center"
      v-if="typeCal == 'center'"
      >{{ text }}</label
    >
    <label class="item-desc">{{ desc }}</label>
    <img
      class="item-arrow"
      src="/img/btn/item-chevron.svg"
      draggable="false"
      v-if="typeCal == 'normal'"
    />
  </div>
</template>

<script>
export default {
  name: "list-item-single",
  props: {
    text: String,
    desc: String,
    type: String,
  },
  data() {
    return {
      typeCal: this.type,
    };
  },
};
</script>

<style lang="scss" scope>
.item {
  width: 100%;
  background-color: #fff;
  padding: 12px 0;
  margin-bottom: 1px;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  flex-direction: column;
  position: relative;
  .item-name,
  .item-desc {
    padding-left: 20px !important;
    width: 100%;
  }
  .item-name {
    font-style: normal;
    font-weight: 500;
    font-size: 16px;
    line-height: 19px;
    color: #4b4b4b;
  }
  .item-desc {
    font-style: normal;
    font-weight: normal;
    font-size: 14px;
    line-height: 16px;
    margin-top: 5px !important;
    /* Card Detail color */

    color: #8b8b8b;
  }
  .item-name-red {
    color: #f03737;
  }
  .item-name-center {
    text-align: center;
    padding-left: 0px !important;
  }
  .item-arrow {
    position: absolute;
    top: 50%;
    right: 20px;
    transform: translateY(-50%);
  }
}
</style>