import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: () => ({
    searchPageOpen: false,
    loggedIn: true,
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
    }
  },
  actions: {},
  modules: {}
})