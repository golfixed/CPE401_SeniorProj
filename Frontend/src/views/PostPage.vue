<template>
  <div id="page-setting" class="fullpage">
    <topNavi type="back" :menu="true" />
    <div class="content-page">
      <div class="post-wrapper">
        <div class="post-head">
          <div class="profile-pic">
            <img :src="post.image" v-if="post.image" />
            <img src="/img/default_profile.svg" v-if="!post.image" />
          </div>
          <div class="text">
            <label class="name">{{ post.firstname }} {{ post.lastname }}</label>
            <label class="time">{{ post.create_at }}</label>
          </div>
        </div>
        <div class="post-content">
          <div class="text" v-if="post.content">
            <label>{{ post.content }} </label>
          </div>
          <div class="pic" v-if="post.pic_url">
            <img :src="post.pic_url" />
          </div>
        </div>
        <!-- <label class="bottom-label">Seen by: {{ post.click_count }}</label> -->
        <div class="post-comment" v-if="commentList.length > 0">
          <div class="section-label">
            <label>Comments</label>
          </div>
          <div class="comment-item" v-for="item in commentList" :key="item.id">
            <div class="profile-img">
              <img :src="item.image" v-if="item.image" />
              <img src="/img/default_profile.svg" v-if="!item.image" />
            </div>
            <div class="text">
              <label class="name"
                >{{ item.firstname }} {{ item.lastname }}</label
              >
              <label class="comment-text">{{ item.text }}</label>
            </div>
          </div>
        </div>
      </div>
      <div class="end-of-page"></div>
      <div class="bottom-section">
        <div class="wrapper">
          <div class="btn-wrapper">
            <div class="comment-sender">
              <div class="add-img-btn">
                <img src="/img/icons/add-img.svg" />
              </div>
              <input type="text" placeholder="comment" v-model="comment.text" />
              <div class="enter-btn" v-on:click="addComment()">
                <img src="/img/icons/arrow-up.svg" />
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import itemSingle from "@/components/lists/item_single.vue";
import topNavi from "@/components/template/top_navibar.vue";
import axios from "@/axios.js";
export default {
  name: "Settings",
  components: {
    topNavi,
    itemSingle,
  },
  data() {
    return {
      user: this.$store.state.user.profile,
      postInfo: [],
      post: [],
      commentList: [],
      comment: {
        text: "",
      },
    };
  },
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }
    this.$store.commit("Close_AllMenu");

    var path = this.$route.path;
    var id = path.replace("/classrooms/post/", "");
    this.post_id = id;
    this.fetchPostInfo(this.post_id);
  },
  methods: {
    openOptionMenu: function (payload) {
      this.$store.commit("Open_optionMenu", payload);
    },
    fetchPostInfo(id) {
      axios.get("/post/" + id).then((res) => {
        if (res.data.false != true) {
          console.log(res);
          this.postInfo = res.data;
          this.post = this.postInfo.post;
          this.commentList = this.postInfo.comment;
        }
      });
    },
    addComment() {
      var comment = {
        post: this.post_id,
        text: this.comment.text,
        create_by: this.$store.state.user.profile.id,
        update_by: this.$store.state.user.profile.id,
      };
      axios.post("/addcomment", comment).then((res) => {
        if (res.data.false != true) {
          console.log(res);
          this.fetchPostInfo(this.post_id);
          this.comment.text = "";
        } else {
          console.log("");
        }
      });
    },
  },
};
</script>

<style lang="scss" scoped>
#page-setting {
  background-color: #f6f6f6;
}

.page-header {
  display: flex;
  justify-content: center;
  align-items: center;
  flex-direction: column;
  padding: 20px 0;
  background-color: #fff;
  width: 100vw;
  border: solid;
  border-width: 0 0 1px 0;
  border-color: #ededed;
  div.profile-pic {
    width: 120px;
    height: 120px;
    position: relative;
    margin-bottom: 20px;
    z-index: 2;
    div.img {
      border-radius: 100%;
      overflow: hidden;
      width: 120px;
      height: 120px;
      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
    }
    div.edit {
      background: linear-gradient(139.07deg, #3c6697 20.27%, #1e9f13 99.96%);
      width: 30px;
      height: 30px;
      display: flex;
      justify-content: center;
      align-items: center;
      position: absolute;
      bottom: 0;
      right: 0;
      border-radius: 100%;
      div.img-edit {
        width: 13px;
        height: 13px;
        img {
          width: 100%;
          height: 100%;
          object-fit: contain;
        }
      }
    }
  }
  h1.names {
    color: #202020;
    font-size: 24px;
    line-height: 26px;
  }
  label.email,
  label.role {
    color: #8b8b8b;
    font-size: 16px;
    padding-top: 5px !important;
  }
}
input {
  margin-bottom: 10px;
}
.btn-wrapper {
  width: 100%;
  margin: 20px 0;
}

.wrapper {
  padding: 0 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
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
  .bottom-label {
    font-style: normal;
    font-weight: normal;
    font-size: 14px;
    line-height: 16px;
    color: #8b8b8b;
  }
}
.post-comment {
  border: 1px solid #ededed;
  border-width: 1px 0 0 0;
  padding-top: 15px;
  .section-label {
    font-style: normal;
    font-weight: normal;
    font-size: 16px;
    line-height: 19px;
    color: #8b8b8b;
    margin-bottom: 5px !important;
  }
  .comment-item {
    display: grid;
    grid-template-columns: 34px auto;
    padding: 10px 0;
    .profile-img {
      width: 100%;
      height: 100%;
      overflow: hidden;
      border-radius: 100px;
      display: flex;
      justify-items: flex-start;
      align-items: center;
      img {
        width: 34px;
        height: 34px;
      }
    }
    .text {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: flex-start;
      padding-left: 10px;
      .name,
      .comment-text {
        display: flex;
        justify-items: flex-start;
        align-items: center;
        font-style: normal;
        font-weight: normal;
        font-size: 14px;
        line-height: 16px;
        color: #505050;
      }
      .name {
        margin-bottom: 2px !important;
        font-weight: 600;
      }
    }
  }
}
.comment-sender {
  background-color: #fff;
  border: 1px solid #ededed;
  padding: 15px;
  margin: 0 -20px -40px -20px;
  display: grid;
  grid-gap: 10px;
  grid-template-columns: 44px auto 44px;
  .enter-btn,
  .add-img-btn {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 44px;
    width: 44px;
    border-radius: 100px;
    overflow: hidden;
    img {
      height: 20px;
      object-fit: contain;
    }
  }
  .enter-btn {
    background: linear-gradient(139.07deg, #3c6697 20.27%, #1e9f13 99.96%);
  }
  input {
    margin-bottom: 0;
  }
}
</style>