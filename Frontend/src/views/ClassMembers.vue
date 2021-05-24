<template>
  <div id="page-setting" class="fullpage">
    <topNavi pageName="Members" type="back" />
    <div class="content-page">
      <div class="items-group">
        <LabelItemGroup text="Class Instructor" />
        <itemContact
          v-for="item in memberList"
          :key="item.id"
          v-if="item.role == 'tea'"
          v-bind:fname="item.fname"
          v-bind:lname="item.lname"
          v-bind:pictureURL="item.pictureURL"
        />
      </div>
      <div class="items-group">
        <LabelItemGroup text="Teacher Assistant" />
        <itemContact
          v-for="item in memberList"
          :key="item.id"
          v-if="item.role == 'ta'"
          v-bind:fname="item.fname"
          v-bind:lname="item.lname"
          v-bind:pictureURL="item.pictureURL"
        />
      </div>
      <div class="items-group">
        <LabelItemGroup text="Students" />
        <itemContact
          v-for="item in memberList"
          :key="item.id"
          v-if="item.role == 'std'"
          v-bind:fname="item.fname"
          v-bind:lname="item.lname"
          v-bind:pictureURL="item.pictureURL"
        />
      </div>
      <div class="end-of-page"></div>
    </div>
  </div>
</template>

<script>
import LabelItemGroup from "@/components/labels/label_item_group.vue";
import itemContact from "@/components/lists/item_contact.vue";
import topNavi from "@/components/template/top_navibar.vue";
export default {
  name: "ClassMember-Page",
  components: {
    topNavi,
    itemContact,
    LabelItemGroup,
  },
  data() {
    return {
      user: this.$store.state.user.profile,
      memberList: [
        {
          id: 1,
          pictureURL: "/img/mockup/profile.png",
          fname: "Peerapong",
          lname: "Thammakaew",
          role: "std",
        },
        {
          id: 2,
          pictureURL: "/img/mockup/profile_volk.png",
          fname: "Bhaksiree",
          lname: "Tongtago",
          role: "std",
        },
        {
          id: 3,
          pictureURL: "/img/mockup/profile_my.png",
          fname: "Nithi",
          lname: "My",
          role: "tea",
        },
        {
          id: 4,
          pictureURL: "/img/mockup/profile_my.png",
          fname: "Nithi",
          lname: "MY",
          role: "std",
        },
        {
          id: 5,
          pictureURL: "/img/mockup/profile.png",
          fname: "Bhaksiree",
          lname: "Wangviboonkij",
          role: "std",
        },
        {
          id: 6,
          pictureURL: "/img/mockup/profile.png",
          fname: "Bhaksiree",
          lname: "Wangviboonkij",
          role: "std",
        },
        {
          id: 7,
          pictureURL: "/img/mockup/profile.png",
          fname: "Bhaksiree",
          lname: "Wangviboonkij",
          role: "ta",
        },
        {
          id: 8,
          pictureURL: "/img/mockup/profile.png",
          fname: "Bhaksiree",
          lname: "Wangviboonkij",
          role: "std",
        },
        {
          id: 9,
          pictureURL: "/img/mockup/profile.png",
          fname: "Bhaksiree",
          lname: "Wangviboonkij",
          role: "ta",
        },
        {
          id: 10,
          pictureURL: "/img/mockup/profile.png",
          fname: "Bhaksiree",
          lname: "Wangviboonkij",
          role: "tea",
        },
      ],
      pollList: {
        id: 0,
        question: "",
        options: [
          {
            id: 1,
            text: "sfsfsf",
            clickCount: 0,
          },
          {
            id: 2,
            text: "sfsfsdfdsdf",
            clickCount: 2,
          },
          {
            id: 3,
            text: "sfssdfsdfsdfsf",
            clickCount: 3,
          },
        ],
      },
    };
  },
  mounted() {
    if (!localStorage.token) {
      this.$router.push({ path: "/" });
    }
  },
  methods: {
    openOptionMenu: function () {
      this.$store.commit("Open_optionMenu");
    },
  },
};
</script>

<style lang="scss" scoped>
#page-setting {
  background-color: #f6f6f6;
}
.items-group {
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
</style>