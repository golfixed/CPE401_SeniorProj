<template>
  <div class="search-page-wrapper">
    <div class="search-page">
      <div class="search-bar app-default-borer-gray">
        <div class="panel">
          <input
            class="app-default-searchbar"
            type="text"
            v-model="keyword"
            placeholder="Search"
          />
          <div v-on:click="closeSearchPage()" class="btn-close">
            <label>Close</label>
          </div>
        </div>
      </div>
      <div class="search-result">
        <div class="result-wrapper">
          <div class="result-section">
            <label>Classrooms</label>
            <div class="result-list">
              <div class="list"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "search-page",
  data: function () {
    return {
      keyword: "",
    };
  },
  methods: {
    closeSearchPage: function () {
      this.$store.commit("Close_searchPage");
    },
  },
};
</script>

<style lang="scss" scoped>
.search-page-wrapper {
  display: flex;
  justify-content: center;
  align-items: flex-start;
  overflow: hidden;
  .search-page {
    width: 100vw;
    height: 100vh;
    background-color: #f6f6f6;
    overflow-x: hidden;
    position: absolute;
    top: 0;
    left: 0;
    z-index: 7;
  }
  .search-bar {
    padding: 20px;
    background-color: #fff;
    .panel {
      display: flex;
      align-items: center;
    }
    div > input {
      font-size: 1.3em;
      height: 40px !important;
      width: calc(100% - 100px);
    }
    div > input::placeholder {
      color: grey;
      font-size: 1.16em;
    }
  }
  .btn-close {
    width: 100px;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin-right: -20px;
    label {
      font-size: 1.3em;
      color: #505050;
    }
  }
  .search-result {
    .result-wrapper {
      .result-section {
        label {
          font-size: 1em;
        }
        div.result-list {
          .list {
            display: block;
          }
        }
      }
    }
  }
}
</style>