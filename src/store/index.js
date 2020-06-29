import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: () => ({
    currentPage: 'Home',
  }),
  mutations: {
    Update_currentPage: (state, pageNum) => {
      if (pageNum == '1') state.currentPage = 'Home';
      else if (pageNum == '2') state.currentPage = 'Page 2';
      else if (pageNum == '3') state.currentPage = 'Page 3';
      else if (pageNum == '4') state.currentPage = 'Menu';
      else state.currentPage = state.currentPage;
    }
  },
  actions: {},
  modules: {}
})