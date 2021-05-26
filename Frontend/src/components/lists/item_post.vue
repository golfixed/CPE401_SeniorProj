<template>
  <div class="item-post" v-on:click="openPost()">
    <div class="post-wrapper">
      <div class="post-head">
        <div class="profile-pic">
          <img :src="postItem.pic_url" v-if="postItem.pic_url" />
          <img src="/img/default_profile.svg" v-if="!postItem.pic_url" />
        </div>
        <div class="text">
          <label class="name"
            >{{ postItem.firstname }} {{ postItem.lastname }}</label
          >
          <label class="time">{{ postItem.create_at }}</label>
        </div>
        <div class="option-btn">
          <img src="/img/icons/label-btn.svg" />
        </div>
      </div>
      <div class="post-content">
        <div class="text">
          <label v-if="postItem.content">{{ postItem.content }} </label>
        </div>
        <div class="pic" v-if="postItem.pic_url">
          <img src="/img/classrooms/news.jpg" />
        </div>
      </div>
      <div class="post-comment"></div>
    </div>
  </div>
</template>

<script>
export default {
  name: "item-post",
  data() {
    return {
      account: {
        id: this.$store.state.user.profile.id,
      },
      post_id: "",
    };
  },
  props: {
    postItem: Object,
  },
  mounted() {
    var path = this.$route.path;
    var id = path.replace("/classrooms/", "");
    this.class_id = id;
  },
  methods: {
    openProfile(id) {
      if (id) this.$router.push("/profile/" + id);
      else console.log("error no user id");
    },
    openPost() {
      this.$router.push("/classrooms/post/" + this.postItem.id);
    },
  },
};
</script>

<style lang="scss" scoped>
.item-post {
  padding-top: 15px;
  .post-wrapper {
    padding: 20px;
    background-color: #fff;
    .post-head {
      display: grid;
      grid-template-columns: 44px auto 30px;
      padding-bottom: 15px;
      .profile-pic {
        width: 44px;
        height: 44px;
        border-radius: 100%;
        overflow: hidden;
        img {
          width: 100%;
          height: 100%;
          object-fit: contain;
        }
      }
      .text {
        display: flex;
        flex-direction: column;
        align-items: flex-start;
        justify-content: center;
        padding-left: 10px;
        .name {
          font-style: normal;
          font-weight: 600;
          font-size: 16px;
          line-height: 20px;
          color: #202020;
          margin-bottom: 4px !important;
        }
        .time {
          font-style: normal;
          font-weight: normal;
          font-size: 14px;
          line-height: 16px;
          text-align: right;
          color: #505050;
        }
      }
      .option-btn {
        width: 100%;
        height: 100%;
        display: flex;
        justify-content: flex-end;
        align-items: flex-start;
        img {
          width: 20px;
          object-fit: contain;
        }
      }
    }
    .post-content {
      .text {
        margin-bottom: 15px;
        label {
          font-style: normal;
          font-weight: normal;
          font-size: 16px;
          line-height: 19px;
          color: #202020;
          display: -webkit-box;
          -webkit-line-clamp: 3;
          -webkit-box-orient: vertical;
          overflow: hidden;
          -webkit-box-pack: end;
        }
      }
      .pic {
        width: 100%;
        height: 200px;
        overflow: hidden;
        border-radius: 10px;
        img {
          width: 100%;
          height: 100%;
          object-fit: cover;
        }
      }
    }
  }
}
</style>