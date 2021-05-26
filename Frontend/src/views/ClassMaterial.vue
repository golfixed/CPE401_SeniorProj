<template>
  <div>
    <div class="items-group">
      <LabelMaterial text="Labsheet Week 4" />
      <div class="add-btn">
        <div class="add-icon">
          <img src="/img/icons/plus-grey.svg" />
        </div>
        <label> add new file</label>
      </div>
    </div>
    <div class="items-group">
      <LabelMaterial text="Course Syllabus" />
      <itemFile
        fileName="Sheet 4"
        fileLink="drive.google.com"
        time="Jan 20, 2021"
      />
      <itemFile
        fileName="Sheet 4"
        fileLink="drive.google.com"
        time="Jan 20, 2021"
      />
      <itemFile
        fileName="Sheet 4"
        fileLink="drive.google.com"
        time="Jan 20, 2021"
      />
      <div class="add-btn">
        <div class="add-icon">
          <img src="/img/icons/plus-grey.svg" />
        </div>
        <label> add new file</label>
      </div>
    </div>
    <div class="items-group">
      <div class="add-btn">
        <div class="add-icon">
          <img src="/img/icons/plus-grey-dark.svg" />
        </div>
        <label class="dark-label">add new label</label>
      </div>
    </div>
    <div class="end-of-page"></div>
  </div>
</template>

<script>
import LabelMaterial from "@/components/labels/label_item_material.vue";
import itemFile from "@/components/lists/item_file.vue";
export default {
  name: "ClassMaterial-Page",
  components: {
    itemFile,
    LabelMaterial,
  },
  data() {
    return {
      user: this.$store.state.user.profile,
      materialList: [
        {
          id: 0,
          topic: "Classwork",
          time: "20:30/21-05-2021",
          item: [
            {
              id: 0,
              title: "Week 1",
              link: "drive.google.com",
              time: "20:30/21-05-2021",
            },
            {
              id: 1,
              title: "Week 1",
              link: "drive.google.com",
              time: "20:30/21-05-2021",
            },
          ],
        },
        {
          id: 1,
          topic: "Classwork",
          time: "20:30/21-05-2021",
          item: [
            {
              id: 0,
              title: "Week 1",
              link: "drive.google.com",
              time: "20:30/21-05-2021",
            },
            {
              id: 1,
              title: "Week 1",
              link: "drive.google.com",
              time: "20:30/21-05-2021",
            },
          ],
        },
      ],
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
.add-btn {
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
</style>