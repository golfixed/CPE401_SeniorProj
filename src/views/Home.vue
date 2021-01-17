<template>
  <div id="page-home" class="app-page">
    <div id="searchbar">
      <div class="app-default-searchbar">
        <label><i class="fas fa-search"></i>Search</label>
      </div>
    </div>
    <div
      id="section-announcement"
      class="section app-default-pinnedbar app-default-borer-gray"
    >
      <div class="pin-title">
        <label>Announcements</label>
      </div>
      <div class="pin-tray-wrap">
        <div class="slide-tray">
          <cardAnnouncement
            v-for="items in announcements"
            :key="items.id"
            v-bind:subject_code="items.subject_code"
            v-bind:subject_title="items.subject_title"
            v-bind:message="items.message"
            v-bind:time="items.time"
          />
        </div>
      </div>
    </div>
    <!-- <hr class="page-hr" /> -->
    <div class="section" style="margin-top: 20px">
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
import cardAnnouncement from "@/components/cards/announcement.vue";
export default {
  name: "Home",
  components: {
    cardAnnouncement,
  },
  data: function () {
    return {
      announcements: [
        {
          id: 1,
          time: "Jan 15 2021 10:23:25",
          subject_code: "CPE 401",
          subject_title: "Senior Project I",
          message:
            "There will be no class this week. Make-up class date will be annouce later.Your lab exercise score and quiz test score will be announced through LEB2, please check it out later.",
        },
        {
          id: 2,
          time: "Jan 10 2021 10:23:25",
          subject_code: "CPE 100",
          subject_title: "Basic Computer Programming Super super",
          message: "Tomorrow is the last day for LAB#3 submission.",
        },
        {
          id: 3,
          time: "Jan 9 2020 10:30:25",
          subject_code: "GEN 352",
          subject_title: "DIGITAL ELECTRONICS AND LOGIC DESIGN",
          message: "Tomorrow is the last day for LAB#3 submission.",
        },
      ],
    };
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
  #section-announcement {
    display: block;
  }
}
</style>
