<template>
  <div>
    <div class="btn-wrapper" v-on:click="createPost(class_id)">
      <div class="post-add-btn">
        <div class="add-icon">
          <img src="/img/icons/plus-grey-dark.svg" />
        </div>
        <label class="dark-label">new post</label>
      </div>
    </div>
    <itemPost v-for="item in postList" :key="item.id" v-bind:postItem="item" />
    <div class="end-of-page"></div>
  </div>
</template>

<script>
import LabelMaterial from "@/components/labels/label_item_material.vue";
import itemPost from "@/components/lists/item_post.vue";
import axios from "@/axios.js";

export default {
  name: "ClassDiscussion-Page",
  components: {
    itemPost,
    LabelMaterial,
  },
  data() {
    return {
      user: this.$store.state.user.profile,
      postList: [],
    };
  },
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }

    var path = this.$route.path;
    var id = path.replace("/classrooms/", "");
    this.class_id = id;
    this.fetchPostList();
  },
  methods: {
    openOptionMenu: function () {
      this.$store.commit("Open_optionMenu");
    },
    createPost(id) {
      console.log(id);
      if (id) this.$router.push("/createpost/" + id);
      else console.log("err: no class_id");
    },
    fetchPostList() {
      axios.get("/getpostlist/" + this.class_id).then((res) => {
        console.log(res);
        if (res.data.false != true) {
          this.postList = res.data.data.reverse();
        }
      });
    },
  },
};
</script>

<style lang="scss" scoped>
.wrapper {
  padding: 0 20px;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.btn-wrapper {
  width: 100vw;

  .post-add-btn {
    margin-top: 15px;
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    background-color: #fff;
    padding: 20px 0;

    .add-icon {
      width: 15px;
      height: 15px;
      margin-right: 10px;
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
      line-height: 16px;
      text-align: right;
      color: #8b8b8b;
    }

    .dark-label {
      color: #505050;
      font-weight: 600;
    }
  }
  .post-add-btn:active {
    background-color: rgb(224, 224, 224);
  }
}
</style>