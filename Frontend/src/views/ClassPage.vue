<template>
  <div id="page-setting" class="fullpage">
    <topNavi type="gohome" :menu="true" optionName="classpage" />
    <div class="content-page">
      <div class="class-info">
        <div class="info">
          <div class="img">
            <img
              :src="classInfo.pictureURL"
              draggable="false"
              v-if="classInfo.pictureURL"
            />
            <img
              src="/img/classrooms/green.jpg"
              draggable="false"
              v-if="!classInfo.pictureURL"
            />
          </div>
          <div class="text">
            <div class="left">
              <label class="code">{{ classInfo.class_code }}</label>
              <label class="title">{{ classInfo.class_name }}</label>
              <label class="section">Section {{ classInfo.section }}</label>
            </div>
            <div class="right">
              <div class="pincode-btn">
                <div class="code-icon">
                  <img src="/img/icons/add_member.svg" />
                </div>
                <label>invite</label>
              </div>
            </div>
          </div>
        </div>
        <!-- <div class="member" v-on:click="openClassMember(classInfo.id)">
          <div class="img-box">
            <div class="member-item">
            </div>
            <div class="member-item" v-for="item in prevMember" :key="item.id">
              <img :src="item.pictureURL" />
            </div>
          </div>
          <div class="all-member-btn">
            <div class="text">All members</div>
            <div class="icon">
              <img src="/img/icons/chevron_right_grey.svg" />
            </div>
          </div>
        </div> -->
        <div class="tabs-wrapper">
          <div class="tabs">
            <div class="tab-item">
              <div class="tab-item-box active" v-if="this.currentTab == 1">
                <label>Discussion</label>
              </div>
              <div
                class="tab-item-box"
                v-on:click="changeTab(1)"
                v-if="this.currentTab != 1"
              >
                <label>Discussion</label>
              </div>
            </div>
            <div class="tab-item">
              <div class="tab-item-box active" v-if="this.currentTab == 2">
                <label>Material</label>
              </div>
              <div
                class="tab-item-box"
                v-on:click="changeTab(2)"
                v-if="this.currentTab != 2"
              >
                <label>Material</label>
              </div>
            </div>
            <div class="tab-item">
              <div class="tab-item-box active" v-if="this.currentTab == 3">
                <label>Members</label>
              </div>
              <div
                class="tab-item-box"
                v-on:click="changeTab(3)"
                v-if="this.currentTab != 3"
              >
                <label>Members</label>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="tabs-page">
        <div
          v-if="currentTab == 1"
          style="height: 1000px; background-color: green"
        ></div>
        <div v-if="currentTab == 2">
          <pageMaterial />
        </div>
        <div v-if="currentTab == 3">
          <pageMember />
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import itemSingle from "@/components/lists/item_single.vue";
import topNavi from "@/components/template/top_navibar.vue";
import pageMember from "@/views/ClassMembers.vue";
import pageMaterial from "@/views/ClassMaterial.vue";
import axios from "@/axios.js";

export default {
  name: "ClassPage-Page",
  components: {
    topNavi,
    itemSingle,
    pageMember,
    pageMaterial,
  },
  data() {
    return {
      currentTab: 1,
      user: this.$store.state.user.profile,
      classInfo: [],
      prevMember: [],
      isLoading: false,
    };
  },
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }
    var path = this.$route.path;
    var class_id = path.replace("/classrooms/", "");

    // console.log("Current class id:" + class_id);
    this.fetchClassInfo(class_id);
  },
  methods: {
    openOptionMenu: function (payload) {
      this.$store.commit("Open_optionMenu", payload);
    },

    // setPrevMember: function (member) {
    //   this.prevMember = member.slice(0, 8);
    // },
    changeTab(tab) {
      this.currentTab = tab;
    },
    openClassMember: function (id) {
      this.$router.push({ path: "/classrooms/" + id + "/member" });
    },
    fetchClassInfo: function (class_id) {
      axios.get("/classrooms/" + class_id).then((res) => {
        if (res.error != true) {
          // console.log("ClassPage: class Info fetched");
          this.classInfo = res.data.data;
        } else {
          // console.log("ClassPage: class Info fetch failed");
        }
      });
      setTimeout(
        function () {
          this.isLoading = false;
        }.bind(this),
        2000
      );
      // this.setPrevMember(this.classInfo.member);
    },
    fetchPost: function () {},
    fetchMaterial: function () {},
  },
};
</script>

<style lang="scss" scoped>
#page-setting {
  background-color: #f6f6f6;
}
.class-info {
  background-color: #fff;
  border: 1px solid #ededed;
  border-width: 0 0 1px 0;
  padding: 20px;
  padding-bottom: 15px;
  .info {
    // display: grid;
    // grid-template-columns: 70px auto;
    display: flex;
    flex-direction: column;
    .img {
      height: 130px;
      width: 100%;
      border-radius: 10px;
      overflow: hidden;
      img {
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
    }
    .text {
      width: 100%;
      display: grid;
      grid-template-columns: auto 60px;
      // padding-left: 15px;
      margin-top: 15px;

      .left {
        width: -webkit-fill-available;
        display: flex;
        justify-content: center;
        align-items: flex-start;
        flex-direction: column;
        padding-right: 15px;
        .code {
          background: linear-gradient(135deg, #3c6697 0%, #3b9b50 100%);
          -webkit-background-clip: text;
          -webkit-text-fill-color: transparent;
          font-style: normal;
          font-weight: bold;
          font-size: 24px;
          line-height: 24px;
          margin-bottom: 6px !important;
        }
        .title {
          font-style: normal;
          font-weight: 600;
          font-size: 20px;
          line-height: 20px;
          color: #505050;
          margin-bottom: 6px !important;
          display: -webkit-box;
          -webkit-line-clamp: 1;
          -webkit-box-orient: vertical;
          overflow: hidden;
          -webkit-box-pack: end;
        }
        .section {
          font-style: normal;
          font-weight: normal;
          font-size: 18px;
          line-height: 19px;
          color: #8b8b8b;
          // margin-bottom: 2px !important;
        }
      }
      .right {
        display: flex;
        justify-content: center;
        align-items: center;
        .pincode-btn {
          display: flex;
          justify-content: center;
          align-items: center;
          flex-direction: column;
          .code-icon {
            width: 26px;
            height: 26px;
            margin-bottom: 5px;
            img {
              width: 100%;
              height: 100%;
              object-fit: contain;
            }
          }
          label {
            font-style: normal;
            font-weight: normal;
            font-size: 14px;
            text-align: center;
            color: #8b8b8b;
          }
        }
      }
    }
  }
  .member {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 25px;
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
    .all-member-btn {
      display: flex;
      justify-content: center;
      align-items: flex-end;
      .text {
        font-style: normal;
        font-weight: normal;
        font-size: 14px;
        line-height: 16px;
        text-align: right;
        color: #c9c9c9;
        margin-right: 10px;
      }
      .icon {
        width: 15px;
        height: 15px;
        img {
          width: 100%;
          height: 100%;
          object-fit: contain;
        }
      }
    }
  }
  .tabs-wrapper {
    // border: 1px solid #ededed;
    // border-width: 1px 0 0 0;
    width: 100%;
    padding-top: 15px;
    // margin-top: 15px;
    .tabs {
      display: flex;
      margin: 0 -20px;

      .tab-item {
        width: 100%;
        justify-content: center;
        align-items: center;

        .tab-item-box {
          display: flex;
          justify-content: center;
          align-items: center;
          width: 100%;
          height: 40px;
          border-radius: 100px;
          label {
            font-style: normal;
            font-weight: normal;
            font-size: 16px;
            line-height: 19px;
            text-align: center;
            color: #505050;
          }
        }
        .active {
          width: 100%;
          background: #f6f6f6;
          border-radius: 100px;
          height: 40px;
          label {
            font-style: normal;
            font-weight: normal;
            font-size: 16px;
            line-height: 19px;
            text-align: center;
            text-align: center;
            color: #505050;
          }
        }
      }
      .tab-item:first-child {
        margin-left: 20px;
      }
      .tab-item:last-child {
        margin-right: 20px;
      }
    }
    .tabs::-webkit-scrollbar {
      display: none;
    }
  }
}
</style>