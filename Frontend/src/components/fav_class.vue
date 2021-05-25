<template>
  <div class="card-wrapper">
    <div class="card card-a" v-on:click="fetchClassInfo(id)">
      <div class="class-pic">
        <img src="/img/classrooms/green.jpg" v-if="!pic" />
        <img :src="pic" v-if="pic" />
      </div>
      <div class="card-text">
        <label class="code">{{ subject_code }}</label>
        <label class="title"> {{ subject_title }}</label>
        <label class="section">Section {{ section }}</label>
      </div>
      <!-- <div class="prev-member-box">
        <div class="member-item">
          <label class="more-num">+{{ prevPic.length }}</label>
        </div>
        <div class="member-item" v-for="item in prevPic" :key="item.id">
          <img :src="item.pictureURL" />
        </div>
      </div> -->
    </div>
  </div>
</template>

<script>
import axios from "@/axios.js";
export default {
  name: "fav-post",
  props: {
    subject_code: String,
    subject_title: String,
    section: String,
    prevMember: Array,
    pic: String,
    id: Number,
  },
  created: function () {},
  computed: {},
  methods: {
    fetchClassInfo: function (class_id) {
      axios.get("/classrooms/" + class_id).then((res) => {
        if (res.error != true) {
          console.log("ClassPage: class Info fetched");
          this.$store.commit("Update_CurrentViewClass", res.data.data);
          this.$router.push("/classrooms/" + class_id);
        } else {
          console.log("ClassPage: class Info fetch failed");
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
  },
  mounted() {
    if (this.prevMember) this.prevPic = this.prevMember.reverse();
    this.link = "/classrooms/" + this.id;
  },
  data() {
    return {
      prevPic: [{}],
      link: "",
    };
  },
};
</script>

<style lang="scss" scoped>
.card-a {
  flex: 0 0 auto;
  width: 140px;
  // min-height: 138px;
  height: fit-content;
  display: block;
  overflow: hidden;
  // padding: 15px;
  // background: linear-gradient(135deg, #3c6697 0%, #3b9b50 100%);
  background: #ffffff;
  box-shadow: 0px 5px 25px 4px rgb(0 0 0 / 7%);
  .class-pic {
    width: 100%;
    height: 100px;
    overflow: hidden;
    // border-radius: 4px;
    img {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }
  }
  .card-text {
    padding: 12px;
    label {
      color: #fff;
      font-size: 12px;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
      -webkit-box-pack: end;
    }
    .code {
      font-style: normal;
      font-weight: bold;
      font-size: 18px;
      line-height: 21px;
      margin-bottom: 5px !important;
      text-transform: uppercase;
      background: linear-gradient(135deg, #3c6697 0%, #3b9b50 100%);
      -webkit-background-clip: text;
      -webkit-text-fill-color: transparent;
    }
    .title {
      font-style: normal;
      font-weight: 600;
      font-size: 14px;
      line-height: 16px;
      margin-bottom: 15px !important;
      min-height: 32px;
      color: #505050;
    }
    .section {
      font-style: normal;
      font-weight: normal;
      font-size: 14px;
      line-height: 16px;
      margin-bottom: 5px !important;
      color: #808080;
    }
  }

  div.message-box {
    padding: 15px 0;
    p.message {
      font-weight: 500;
      color: #fff;
      font-size: 16px;
      display: -webkit-box;
      -webkit-line-clamp: 2;
      -webkit-box-orient: vertical;
      overflow: hidden;
      -webkit-box-pack: end;
    }
  }

  label.message-time {
    opacity: 0.6;
    text-transform: none;
  }
}
//Misc Styles
.card {
  // -webkit-box-shadow: 0px 2px 10px 0px rgba(0, 0, 0, 0.1);
  // -moz-box-shadow: 0px 2px 10px 0px rgba(0, 0, 0, 0.1);
  // box-shadow: 0px 2px 10px 0px rgba(0, 0, 0, 0.1);
  border-radius: 10px;
}
.card-wrapper {
  padding-right: 15px;
  margin-bottom: 10px;
}
.card-wrapper:first-child {
  padding-left: 0px;
}
.card-wrapper:last-child {
  padding-right: 20px;
  margin-right: 20px;
}
.prev-member-box {
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
</style>