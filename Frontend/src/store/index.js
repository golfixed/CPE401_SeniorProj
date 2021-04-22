import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: () => ({
    searchPageOpen: false,
    loggedIn: true,
    selected_ancmt: {},
    user:{
      profile: {
        firstName: 'Peerapong',
        lastName: 'Thammakaew',
        pic: '/img/mockup/profile.png',
        role: 'ta',
        sex: 'male',
        email: 'peerapong.tmk@mail.kmutt.ac.th',
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
    }
  },
  actions: {},
  modules: {}
})