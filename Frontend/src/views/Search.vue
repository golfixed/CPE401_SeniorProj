<template>
  <div class="search-page">
    <div class="search-bar app-default-border-gray">
      <div class="panel">
        <input
          class="app-default-searchbar"
          type="text"
          v-model="keyword"
          placeholder="Search"
          ref="searchInput"
        />
        <div @click="$router.go(-1)" class="btn-close">
          <label>Close</label>
        </div>
      </div>
    </div>
    <div class="search-result">
      <div class="result-wrapper">
        <div class="result-section" v-if="searchResults.classrooms.length > 0">
          <label>Classrooms</label>
          <div class="result-list">
            <div class="list">
              <div
                class="class-item"
                v-for="item in searchResults.classroomsTop2"
                :key="item.id"
              >
                <div class="class-img">
                  <img :src="item.pic" />
                </div>
                <div class="class-name">
                  <h3 class="textline textline-2">
                    {{ item.code }} {{ item.title }}
                  </h3>
                  <label>Section {{ item.section }}</label>
                </div>
              </div>
              <div
                class="btn-showmore"
                v-if="this.searchResults.classrooms.length > 2"
              >
                <label> show more</label>
              </div>
            </div>
          </div>
        </div>
        <div
          class="result-section second-sect"
          v-if="searchResults.contacts.length > 0"
        >
          <label>Contacts</label>
          <div class="result-list">
            <div class="list">
              <div
                class="class-item"
                v-for="item in searchResults.contactsTop2"
                :key="item.id"
              >
                <div class="class-img round-img">
                  <img :src="item.pic" />
                </div>
                <div class="class-name">
                  <h3 class="textline textline-2">
                    {{ item.fName }} {{ item.lName }}
                  </h3>
                  <label>in {{ item.from.code }} {{ item.from.title }}</label>
                </div>
              </div>
            </div>
            <div
              class="btn-showmore"
              v-if="this.searchResults.contacts.length > 2"
            >
              <label> show more</label>
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
      searchResults: {
        classrooms: [
          {
            id: 0,
            code: "CPE 401",
            title: "Senior Project I",
            pic: "/img/mockup/class.png",
            section: 1,
          },
          {
            id: 1,
            code: "CPE 100",
            title: "Basic Computer Programming super super",
            pic: "/img/mockup/class.png",
            section: 3,
          },
          {
            id: 2,
            code: "GEN 352",
            title: "General Management",
            pic: "/img/mockup/class.png",
            section: 1,
          },
        ],
        classroomsTop2: [
          {
            id: 0,
            code: "CPE 401",
            title: "Senior Project I",
            pic: "/img/mockup/class.png",
            section: 1,
          },
          {
            id: 1,
            code: "CPE 100",
            title: "Basic Computer Programming super super",
            pic: "/img/mockup/class.png",
            section: 3,
          },
        ],
        contacts: [
          {
            id: 0,
            fName: "Peerapong",
            lName: "Thammakaew",
            pic: "/img/mockup/profile.png",
            from: {
              code: "CPE 401",
              title: "Senior Project I",
            },
          },
          {
            id: 1,
            fName: "Nithiwdee ",
            lName: "Wangviboonkij",
            pic: "/img/mockup/profile_volk.png",
            from: {
              code: "CPE 401",
              title: "Senior Project I",
            },
          },
          {
            id: 2,
            fName: "Bhaksiree",
            lName: "Tongtago",
            pic: "/img/mockup/profile_my.png",
            from: {
              code: "CPE 401",
              title: "Senior Project I",
            },
          },
          {
            id: 3,
            fName: "Bhaksiree",
            lName: "Tongtago",
            pic: "/img/mockup/profile_my.png",
            from: {
              code: "CPE 401",
              title: "Senior Project I",
            },
          },
          {
            id: 4,
            fName: "Bhaksiree",
            lName: "Tongtago",
            pic: "/img/mockup/profile_my.png",
            from: {
              code: "CPE 401",
              title: "Senior Project I",
            },
          },
        ],
        contactsTop2: [
          {
            id: 0,
            fName: "Peerapong",
            lName: "Thammakaew",
            pic: "/img/mockup/profile.png",
            from: {
              code: "CPE 401",
              title: "Senior Project I",
            },
          },
          {
            id: 1,
            fName: "Nithiwdee ",
            lName: "Wangviboonkij",
            pic: "/img/mockup/profile_volk.png",
            from: {
              code: "CPE 401",
              title: "Senior Project I",
            },
          },
        ],
      },
    };
  },
  props: {},
  mounted() {
    this.autoFocus();
  },
  methods: {
    closeSearchPage: function () {
      this.$emit("closePage");
      this.keyword = "";
    },
    autoFocus: function () {
      this.$refs.searchInput.focus();
    },
  },
  computed: {
    screenheight: function () {
      return window.innerHeight;
    },
    screenwidth: function () {
      return window.innerWidth;
    },
  },
  created() {},
};
</script>

<style lang="scss" scoped>
.search-page {
  width: 100vw;
  height: 100vh;
  background-color: #f6f6f6;
  position: absolute;
  top: 0;
  left: 0;
  z-index: 30;
}
.search-page::-webkit-scrollbar {
  display: none;
}
.search-bar {
  padding: 20px;
  background-color: #fff;
  position: fixed;
  width: 100vw;
  .panel {
    display: flex;
    align-items: center;
  }
  div > input {
    font-size: 1.3em;
    width: calc(100% - 160px);
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
    padding: 20px;
    margin-top: 81px;
    overflow: scroll;
    height: calc(100vh - 81px);
    position: fixed;
    .result-section {
      label {
        font-size: 1.3em;
        color: #8b8b8b;
      }
      div.result-list {
        .list {
          display: block;
          padding-top: 15px;
        }
      }
    }
  }
  .class-item {
    background-color: #fff;
    border-radius: 10px;
    height: fit-content;
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px;
    margin-bottom: 10px;
    .class-name {
      width: calc(100% - 55px);
      h3 {
        font-size: 1.3em;
        color: #505050;
        margin-bottom: 3px !important;
      }
      label {
        font-size: 1.13em;
        color: #8b8b8b;
      }
    }
    .class-img {
      width: 40px;
      height: 40px;
      border-radius: 5px;
      overflow: hidden;
      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
    }
    .round-img {
      border-radius: 1000px;
    }
  }
  .btn-showmore {
    background-color: #fff;
    height: 40px;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 10px;
    label {
      font-size: 1.3em;
      color: #4b4b4b;
    }
  }
}
.second-sect {
  margin-top: 20px;
}
</style>