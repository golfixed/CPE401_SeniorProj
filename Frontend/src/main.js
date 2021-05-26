import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './registerServiceWorker'
import axios from '@/axios.js'
import VuePageTransition from 'vue-page-transition'
import VueBottomDialog from 'vue-bottom-dialog'
import PulseLoader from 'vue-spinner/src/PulseLoader.vue'
import VueClipboard from 'vue-clipboard2'
import KProgress from 'k-progress';
import OnoffToggle from 'vue-onoff-toggle'

Vue.use(axios)
Vue.use(VuePageTransition)
Vue.use(VueBottomDialog)
Vue.use(PulseLoader)
Vue.use(VueClipboard)
Vue.use(OnoffToggle)
Vue.component('k-progress', KProgress);

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
  VueClipboard,
  KProgress,
  render: h => h(App)
}).$mount('#app')






