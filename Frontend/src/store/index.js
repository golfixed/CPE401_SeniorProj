import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: () => ({
    searchPageOpen: false,
    loggedIn: true,
    selected_ancmt: {}
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