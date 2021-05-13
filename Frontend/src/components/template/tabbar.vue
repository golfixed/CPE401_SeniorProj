<template>
  <div id="tabbar">
    <div class="tabbar-panel">
      <router-link to="/" class="tab-item">
        <div class="tab-btn" v-on:click="scrollTop()">
          <div class="icon">
            <img
              class="inactive"
              src="/img/icons/tab-home.svg"
              draggable="false"
            />
            <img
              class="active"
              src="/img/icons/tab-home-active.svg"
              draggable="false"
            />
          </div>
          <label>Home</label>
        </div>
      </router-link>
      <router-link to="/classrooms" class="tab-item">
        <div class="tab-btn" v-on:click="scrollTop()">
          <div class="icon">
            <img
              class="inactive"
              src="/img/icons/tab-classroom.svg"
              draggable="false"
            />
            <img
              class="active"
              src="/img/icons/tab-classroom-active.svg"
              draggable="false"
            />
          </div>
          <label>Classrooms</label>
        </div>
      </router-link>
      <router-link to="/chats" class="tab-item">
        <div class="tab-btn" v-on:click="scrollTop()">
          <div class="icon">
            <img
              class="inactive"
              src="/img/icons/tab-chat.svg"
              draggable="false"
            />
            <img
              class="active"
              src="/img/icons/tab-chat-active.svg"
              draggable="false"
            />
          </div>
          <label>Chats</label>
        </div>
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "tabbar",
  methods: {
    scrollTop: function () {
      document.querySelector(".app-view").scroll(0, 0);
    },
  },
};
</script>

<style lang="scss" scoped>
#tabbar {
  .tabbar-panel {
    display: grid;
    grid-template-columns: repeat(3, 33.33%);
    height: 60px;
    position: relative;
    border: 1px solid #ededed;
    border-width: 1px 0 0 0;
    // padding: 5px 20px 20px 20px;
  }
  .tab-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    div.tab-btn {
      width: 100%;
      height: 100%;
      display: flex;
      align-items: center;
      justify-content: center;
      flex-direction: column;
    }
    div.icon {
      height: 25px;
      width: 25px;
      .active {
        display: none;
      }
      .inactive {
        display: block;
      }
      img {
        height: 100%;
        width: 100%;
        object-fit: contain;
      }
    }
    label {
      font-size: 1em;
      margin-top: 3px;
      color: #9a9a9a;
      font-weight: 400;
    }
  }
  .router-link-exact-active {
    label {
      background: linear-gradient(
        135deg,
        rgba(60, 102, 151, 1) 0%,
        rgba(59, 155, 80, 1) 100%
      );
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
      font-weight: 400;
    }
    .icon {
      .active {
        display: block !important;
      }
      .inactive {
        display: none !important;
      }
    }
  }
}
</style>