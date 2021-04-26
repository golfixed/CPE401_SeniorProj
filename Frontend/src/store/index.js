import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: () => ({
    searchPageOpen: false,
    loggedIn: true,
    selected_ancmt: {},
    optionMenuOpen: false,
    overlayShow: false,
    user:{
      profile: {
        firstName: 'Peerapong',
        lastName: 'Thammakaew',
        pic: '/img/mockup/profile.png',
        role: 'ta',
        sex: 'male',
        email: 'peerapong.tmk@mail.kmutt.ac.th',
        phoneNo: '0984133769',
        password: '******',
        setting: {
          noti: {
            class: true,
            chat: false,
          }
        }
      }
    }
  }),
  mutations: {
    Open_searchPage: (state) => {
      state.searchPageOpen = true;
    },
    Close_searchPage: (state) => {
      state.searchPageOpen = false;
    },
    LogIn:(state)=>{
      state.loggedIn = true;
    },
    Open_announcement: (state, payload) => {
      state.selected_ancmt = payload
    },
    Open_optionMenu: (state) => {
      state.optionMenuOpen = true;
      state.overlayShow = true;
    },
    Close_AllMenu: (state) => {
      state.optionMenuOpen = false;
      state.overlayShow = false;
    }
  },
  actions: {},
  modules: {}
})