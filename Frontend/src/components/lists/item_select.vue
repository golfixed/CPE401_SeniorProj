<template>
  <div class="item-selectbox">
    <label class="item-name">{{ label }}</label>
    <div class="item-select" v-if="type == 'sex'">
      <select v-on:click="clickSelect('sex')">
        <option
          value=""
          selected
          disabled
          hidden
          v-if="user.sex == 'male' && selectClick.sex == true"
        >
          Male
        </option>
        <option
          value=""
          selected
          disabled
          hidden
          v-if="user.sex == 'female' && selectClick.sex == true"
        >
          Female
        </option>
        <option>Male</option>
        <option>Female</option>
      </select>
    </div>
    <div class="item-select" v-if="type == 'class'">
      <select v-on:click="clickSelect('class')">
        <option
          value=""
          selected
          disabled
          hidden
          v-if="
            user.setting.noti.class == true && selectClick.noti_class == true
          "
        >
          ON
        </option>
        <option
          value=""
          selected
          disabled
          hidden
          v-if="
            user.setting.noti.class == false && selectClick.noti_class == true
          "
        >
          OFF
        </option>
        <option>ON</option>
        <option>OFF</option>
      </select>
    </div>
    <div class="item-select" v-if="type == 'noti'">
      <select v-on:click="clickSelect('class')">
        <option
          value=""
          selected
          disabled
          hidden
          v-if="user.setting.noti.chat == true && selectClick.noti_chat == true"
        >
          ON
        </option>
        <option
          value=""
          selected
          disabled
          hidden
          v-if="
            user.setting.noti.chat == false && selectClick.noti_chat == true
          "
        >
          OFF
        </option>
        <option>ON</option>
        <option>OFF</option>
      </select>
    </div>
    <div class="item-select" v-if="type == 'role'">
      <select v-on:click="clickSelect('role')">
        <option
          value=""
          selected
          v-if="user.role == 'lec' && selectClick.role == true"
        >
          {{ user.role }}
        </option>
        <option
          value=""
          selected
          v-if="user.role == 'ta' && selectClick.role == true"
        >
          Teacher Assistant
        </option>
        <option
          value=""
          selected
          v-if="user.role == 'std' && selectClick.role == true"
        >
          Student
        </option>
        <option>Student</option>
        <option>Lecturer</option>
        <option>Teacher Assistnt</option>
      </select>
    </div>
  </div>
</template>

<script>
export default {
  name: "list-item-select",
  props: {
    type: String,
    label: String,
    preInfo: String,
  },
  data() {
    return {
      user: this.$store.state.user.profile,
      selectClick: {
        sex: true,
        role: true,
        noti_class: true,
        noti_chat: true,
      },
    };
  },
  methods: {
    clickSelect: function (opt) {
      if ((opt = "sex")) this.selectClick.sex = false;
      if ((opt = "role")) this.selectClick.role = false;
      if ((opt = "noti_class")) this.selectClick.noti_class = false;
      if ((opt = "noti_chat")) this.selectClick.noti_chat = false;
    },
  },
};
</script>

<style lang="scss" scope>
.item-selectbox {
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
}
.item-select {
  max-width: 100vw;
  width: -webkit-fill-available;
  padding: 10px 20px 5px 20px;
  select {
    background-color: #fff;
    border: solid;
    border-width: 1px;
    border-color: #ededed;
    border-radius: 10px;
    outline: none;
    height: 40px;
    width: 100%;
    text-indent: 20px;
    font-size: 16px;
    box-shadow: none;
  }
}
</style>