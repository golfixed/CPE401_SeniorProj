import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: () => ({
    currentPage: 'Home',
  }),
  mutations: {
    Update_currentPage: (state, title) => {
      state.currentPage = title;
    }
  },
  actions: {},
  modules: {}
})