<template>
  <transition name="slidein">
    <div id="menu-panel" v-if="isOpen == true">
      <div class="top-grey-bar"></div>
      <div class="wrapper-menu-item" v-if="currentPage == '/home'">
        <optionMenu
          v-for="option in optionHome"
          :key="option.id"
          v-bind:label="option.label"
          v-bind:iconURL="option.iconURL"
          v-bind:link="option.url"
        />
      </div>
      <div class="wrapper-menu-item" v-if="currentPage == '/classroom'">
        <optionMenu
          v-for="option in optionClass"
          :key="option.id"
          v-bind:label="option.label"
          v-bind:iconURL="option.iconURL"
          v-bind:link="option.url"
        />
      </div>
      <div class="wrapper-menu-item" v-if="currentPage == '/chats'">
        <optionMenu
          v-for="option in optionChat"
          :key="option.id"
          v-bind:label="option.label"
          v-bind:iconURL="option.iconURL"
          v-bind:link="option.url"
        />
      </div>
      <div class="btn-cancel" v-on:click="closeAllMenu()">
        <label>Cancel</label>
      </div>
    </div>
  </transition>
</template>

<script>
import optionMenu from "@/components/lists/item_option.vue";
export default {
  name: "option-menu",
  components: {
    optionMenu,
  },
  mounted() {},
  methods: {
    closeAllMenu: function () {
      this.$store.commit("Close_AllMenu");
    },
  },
  computed: {
    currentPage: function () {
      return this.$route.path;
    },
    isOpen: function () {
      return this.$store.state.optionMenuOpen;
    },
  },
  data() {
    return {
      optionHome: [
        {
          id: 0,
          label: "Sort By",
          iconURL: "/img/btn/menuOption/sort.svg",
          url: "",
        },
        {
          id: 1,
          label: "Clear All Announcements",
          iconURL: "/img/btn/menuOption/clear.svg",
          url: "",
        },
        {
          id: 2,
          label: "Notification Settings",
          iconURL: "/img/btn/menuOption/noti.svg",
          url: "/settings/notification",
        },
        {
          id: 3,
          label: "Settings",
          iconURL: "/img/btn/menuOption/setting.svg",
          url: "/settings",
        },
      ],
      optionClass: [],
      optionChat: [
        {
          id: 0,
          label: "Notification Settings",
          iconURL: "/img/btn/menuOption/noti.svg",
          url: "/settings/notification",
        },
        {
          id: 1,
          label: "Settings",
          iconURL: "/img/btn/menuOption/setting.svg",
          url: "/settings",
        },
      ],
    };
  },
};
</script>

<style lang="scss" scoped>
#menu-panel {
  width: 100vw;
  height: fit-content;
  position: absolute;
  left: 0;
  // bottom: -100%;
  bottom: 0;
  z-index: 11;
  box-shadow: 0px -3px 20px 5px rgba(0, 0, 0, 0.08);
  border-radius: 20px 20px 0px 0px;
  overflow: hidden;
  background-color: #fff;
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding-bottom: 40px;
  transition: all 0.3s;
  .top-grey-bar {
    height: 5px;
    width: 50px;
    background: #ededed;
    border-radius: 100px;
    margin-top: 10px;
  }
  .wrapper-menu-item {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: flex-start;
    flex-direction: column;
  }
}
.slidein-enter-active {
  bottom: 0;
}
.slidein-leave-active {
  bottom: -100%;
}
.btn-cancel {
  margin-top: 40px;
  height: 50px;
  width: calc(100% - 40px);
  display: flex;
  align-items: center;
  justify-content: center;
  background: #f6f6f6;
  border-radius: 20px;
  label {
    font-style: normal;
    font-weight: normal;
    font-size: 18px;
    line-height: 21px;
    text-align: center;
    color: #8b8b8b;
  }
}
</style>