<template>
  <div class="item-poll">
    <div class="post-wrapper">
      <div class="post-head">
        <div class="profile-pic">
          <img src="/img/mockup/profile_my.png" />
        </div>
        <div class="text">
          <label class="name">Nithiwadee Wangvibbonkij</label>
          <label class="time">Jan 20, 2021</label>
        </div>
        <div class="option-btn">
          <img src="/img/icons/label-btn.svg" />
        </div>
      </div>
      <div class="post-content">
        <div class="text">
          <label
            >Alright at the moment 9 out of 15 students will have exam on
            Thursday at 1 pm, and i dont think they all will attend my class or
            pay concentrate. Alright at the moment 9 out of 15 students will
            have exam on Thursday at 1 pm, and i dont think they all will attend
            my class or pay concentrate.
          </label>
        </div>
        <div class="poll">
          <div class="topic">
            <label>When should we move the final examination day to? </label>
          </div>
          <div class="option-item">
            <label class="label">Tuesday, 21st June, 2020</label>
            <div>
              <k-progress
                :percent="40"
                status="success"
                :line-height="12"
                color="#3C6697"
              ></k-progress>
            </div>
          </div>
          <div class="option-item">
            <label class="label">Saturday, 25th June, 2020</label>
            <div>
              <k-progress
                :percent="60"
                status="success"
                :line-height="12"
                color="#3C6697"
              ></k-progress>
            </div>
          </div>
          <div class="button"></div>
        </div>
      </div>
      <div class="post-comment"></div>
    </div>
  </div>
</template>

<script>
import KProgress from "k-progress";
export default {
  name: "item-poll",
  components: {
    KProgress,
  },
  data() {
    return {};
  },
};
</script>

<style lang="scss" scoped>
.item-poll {
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
      .poll {
        padding: 15px;
        background-color: #f8f8f8;
        border-radius: 10px;
        .topic {
          width: 100%;
          border: 1px solid #e0e0e0;
          border-width: 0 0 1px 0;
          margin-bottom: 15px;
          padding-bottom: 5px;
          label {
            font-style: normal;
            font-weight: 600;
            font-size: 16px;
            line-height: 20px;
            color: #202020;
          }
        }
        .option-item {
          margin-bottom: 10px;
          label {
            font-style: normal;
            font-weight: 500;
            font-size: 16px;
            line-height: 20px;
            color: #202020;
            margin-bottom: 10px !important;
          }
        }
      }
    }
  }
}
</style>