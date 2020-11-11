<template>
  <div id="page-home" class="app-page">
    <div id="searchbar">
      <div class="app-default-searchbar">
        <label><i class="fas fa-search"></i>Search</label>
      </div>
    </div>
    <!-- <hr class="page-hr" /> -->
    <div class="section">
      <h2 style="font-size: 20px">Current screen resolution:</h2>
      <h4 style="font-size: 30px; color: green">
        {{ screenwidth }} × {{ screenheight }}
      </h4>
    </div>
  </div>
</template>

<script>
import { library } from "@fortawesome/fontawesome-svg-core";
import { faUserSecret } from "@fortawesome/free-solid-svg-icons";
export default {
  name: "Home",
  components: {},
  data: function () {
    return {};
  },
  created: function () {},
  methods: {},
  computed: {
    screenheight: function () {
      return window.innerHeight;
    },
    screenwidth: function () {
      return window.innerWidth;
    },
    helloUser: function () {
      const time = new Date();
      const currentTime = time.getHours();
      // console.log(currentTime);
      if (currentTime < 0) return "Time Error!";
      else if (currentTime >= 0 && currentTime < 6) return "Good night";
      else if (currentTime >= 6 && currentTime < 12) return "Good morning";
      else if (currentTime >= 12 && currentTime < 17) return "Good Afternoon";
      else if (currentTime >= 17 && currentTime < 21) return "Good Evening";
      else if (currentTime >= 21 && currentTime < 24) return "Good night";
      else return "Time error!";
    },
    currentYear: function () {
      const year = new Date();
      return year.getFullYear().toString().substring(2);
    },
    currentDay: function () {
      const day = new Date();
      const currentDay = day.getDay();

      if (currentDay == 1) return "Monday";
      else if (currentDay == 2) return "Tuesday";
      else if (currentDay == 3) return "Wednesday";
      else if (currentDay == 4) return "Thursday";
      else if (currentDay == 5) return "Friday";
      else if (currentDay == 6) return "Saturday";
      else if (currentDay == 0) return "Sunday";
      else return "Day error!";
    },
    currentMonth: function () {
      const month = new Date();
      const currentMonth = month.getMonth() + 1;

      if (currentMonth == 1) return "January";
      else if (currentMonth == 2) return "February";
      else if (currentMonth == 3) return "March";
      else if (currentMonth == 4) return "April";
      else if (currentMonth == 5) return "May";
      else if (currentMonth == 6) return "June";
      else if (currentMonth == 7) return "July";
      else if (currentMonth == 8) return "August";
      else if (currentMonth == 9) return "September";
      else if (currentMonth == 10) return "October";
      else if (currentMonth == 11) return "November";
      else if (currentMonth == 12) return "December";
      else return "Month error!";
    },
    currentDate: function () {
      const numdate = new Date();
      return numdate.getDate();
    },
  },
};
</script>
<style lang="scss" scoped>
#page-home {
  display: block;
  #sec-welcome {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    padding-bottom: 40px;
    .welcome-txt {
      label {
        color: #9a9a9a;
        font-size: 1.5em;
        font-weight: 400;
      }
      h1 {
        color: #4b4b4b;
        font-size: 2.75em;
        margin-top: 5px;
        font-weight: 700;
      }
    }
    .profile-btn {
      width: 66px;
      height: 66px;
      border-radius: 100%;
      overflow: hidden;
      img {
        width: 100%;
        height: 100%;
        object-fit: contain;
      }
    }
  }
  #sec-todayclass {
    padding-bottom: 10px;
    .todayclass-pane {
      display: flex;
      flex-wrap: nowrap;
      overflow-x: auto;
      margin: 0 -30px;
      width: 100vw;
      @media screen and (max-width: 375px) {
        margin: 0 0 0 -20px;
      }
    }
    .todayclass-pane::-webkit-scrollbar {
      display: none;
    }
    .todayclass-item {
      flex: 0 0 auto;
      padding: 20px 20px 30px 0;
    }
    .todayclass-item:first-child {
      padding-left: 30px;
      @media screen and (max-width: 375px) {
        padding-left: 20px;
      }
    }
    .todayclass-card {
      width: 330px;
      height: 170px;
      border-radius: 20px;
      background: #e94a26;
      box-shadow: 0px 5px 25px rgba(0, 0, 0, 0.16);

      @media screen and (max-width: 375px) {
        width: 290px;
      }
    }
  }
  #sec-shortcuts {
    .shortcut-pane {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-bottom: 20px;
      .shortcut-item {
        width: 25%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
        div.icon {
          height: 40px;
          width: 40px;
          img {
            width: 100%;
            height: 100%;
            object-fit: contain;
          }
        }
        label {
          color: #e94a26;
          margin-top: 10px;
        }
      }
    }
  }
}
</style>
