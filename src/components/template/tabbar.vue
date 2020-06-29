<template>
  <div id="tabbar">
    <div class="tabbar-panel">
      <router-link to="/" class="tab-item">
        <div class="icon" v-on:click="tabTap(1);">
          <img class="inactive" src="/img/icons/tab-home.svg" draggable="false" />
          <img class="active" src="/img/icons/tab-home-active.svg" draggable="false" />
        </div>
        <!-- <label>Home</label> -->
      </router-link>
      <router-link to="/today" class="tab-item">
        <div class="icon" v-on:click="tabTap(2);">
          <img class="inactive" src="/img/icons/tab-home.svg" draggable="false" />
          <img class="active" src="/img/icons/tab-home-active.svg" draggable="false" />
        </div>
        <!-- <label>tab 1</label> -->
      </router-link>
      <div class="tab-item">
        <div class="center-btn">
          <div class="icon">
            <img src="/img/icons/tab-plus.svg" draggable="false" />
          </div>
        </div>
      </div>
      <router-link to="/file" class="tab-item">
        <div class="icon" v-on:click="tabTap(3);">
          <img class="inactive" src="/img/icons/tab-home.svg" draggable="false" />
          <img class="active" src="/img/icons/tab-home-active.svg" draggable="false" />
        </div>
        <!-- <label>tab 2</label> -->
      </router-link>
      <router-link to="/menu" class="tab-item">
        <div class="icon" v-on:click="tabTap(4);">
          <img class="inactive" src="/img/icons/tab-menu.svg" draggable="false" />
          <img class="active" src="/img/icons/tab-menu-active.svg" draggable="false" />
        </div>
        <!-- <label>More</label> -->
      </router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "tabbar",
  methods: {
    tabTap: function(num) {
      this.$store.commit("Update_currentPage", num);
    }
  }
};
</script>

<style lang="scss" scoped>
#tabbar {
  .tabbar-panel {
    display: grid;
    grid-template-columns: repeat(5, 20%);
    background-color: #ffffff;
    height: 60px;
    box-shadow: 0px -5px 20px rgba(0, 0, 0, 0.16);
    position: relative;
    padding-bottom: 20px;
  }
  .tab-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    text-decoration: none;
    div.icon {
      height: 20px;
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
      margin-top: 6px;
      color: #9a9a9a;
      font-weight: 400;
    }
  }
  .router-link-exact-active {
    label {
      color: #e94a26;
      font-weight: bold;
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
  .center-btn {
    width: 66px;
    height: 66px;
    background: #e94a26;
    border: 2px solid #fff;
    border-radius: 100%;
    filter: drop-shadow(0px 5px 10px rgba(0, 0, 0, 0.2));
    margin-top: -40px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
}
</style>