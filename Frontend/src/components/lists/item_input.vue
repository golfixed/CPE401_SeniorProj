<template>
  <div class="item-inputbox">
    <label class="item-name">{{ label }}</label>
    <div class="item-input" v-if="type == 'textbox'">
      <input type="text" :placeholder="preInfo" />
    </div>
  </div>
</template>

<script>
export default {
  name: "list-item-input",
  props: {
    type: String,
    label: String,
    preInfo: String,
  },
};
</script>

<style lang="scss" scope>
.item-inputbox {
  width: 100%;
  background-color: #fff;
  padding: 12px 0;
  display: flex;
  justify-content: center;
  align-items: flex-start;
  flex-direction: column;
  position: relative;
  margin-bottom: 1px;
  .item-name,
  .item-desc {
    padding-left: 20px !important;
    width: -webkit-fill-available;
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
  .item-name-green {
    color: #479f60;
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
  .item-input {
    max-width: 100vw;
    width: -webkit-fill-available;
    padding: 10px 20px 5px 20px;
    input {
      max-width: 100%;
      padding: 0 !important;
      margin: 0 !important;
    }
  }
}
</style>