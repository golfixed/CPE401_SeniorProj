import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './registerServiceWorker'
import axios from '@/axios.js'
import VuePageTransition from 'vue-page-transition'
import VueBottomDialog from 'vue-bottom-dialog'
import PulseLoader from 'vue-spinner/src/PulseLoader.vue'

Vue.use(axios)
Vue.use(VuePageTransition)
Vue.use(VueBottomDialog)
Vue.use(PulseLoader)

var moment = require('moment'); // require
var dayjs = require('dayjs')


// const { JSDOM } = require("jsdom");
// const { window } = new JSDOM("");
// const $ = require("jquery")(window);

dayjs().format();
moment().format();
Vue.config.productionTip = false


new Vue({
  router,
  store,
  axios,
  moment,
  VuePageTransition,
  PulseLoader,
  render: h => h(App)
}).$mount('#app')






