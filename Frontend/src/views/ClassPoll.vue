<template>
  <div>
    <div class="poll-add-btn" v-on:click="createPoll(class_id)">
      <div class="add-icon">
        <img src="/img/icons/plus-grey-dark.svg" />
      </div>
      <label class="dark-label">new poll</label>
    </div>
    <itemPoll />
    <itemPoll />
    <div class="end-of-page"></div>
  </div>
</template>

<script>
import LabelMaterial from "@/components/labels/label_item_material.vue";
import itemPoll from "@/components/lists/item_poll.vue";

export default {
  name: "ClassPoll-Page",
  components: {
    itemPoll,
    LabelMaterial,
  },
  data() {
    return {
      user: this.$store.state.user.profile,
    };
  },
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }
    var path = this.$route.path;
    var id = path.replace("/classrooms/", "");
    this.class_id = id;
  },
  methods: {
    createPoll(id) {
      this.$router.push("/createpoll/" + this.class_id);
    },
    openOptionMenu: function () {
      this.$store.commit("Open_optionMenu");
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
.poll-add-btn {
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
.poll-add-btn:active {
  background-color: rgb(224, 224, 224);
}
</style>