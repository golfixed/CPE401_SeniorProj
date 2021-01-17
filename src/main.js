import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import './registerServiceWorker'
import { library } from '@fortawesome/fontawesome-svg-core'
import { faUserSecret } from '@fortawesome/free-solid-svg-icons'
import { FontAwesomeIcon } from '@fortawesome/vue-fontawesome'
var moment = require('moment'); // require
var dayjs = require('dayjs')


dayjs().format();
moment().format();
Vue.config.productionTip = false


new Vue({
  router,
  store,
  moment,
  render: h => h(App)
}).$mount('#app')
