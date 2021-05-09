import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: () => ({
    searchPageOpen: false,
    // loggedIn: false,
    selected_ancmt: {},
    optionMenuOpen: false,
    overlayShow: false,
    user: {
      profile: {
        firstName: '',
        lastName: '',
        pic: '/img/default_profile.svg',
        role: '',
        sex: '',
        email: '',
        phoneNo: '',
        password: '',
      },
      setting: {
        noti: {
          class: true,
          chat: false,
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
    fetchProfile: (state, payload) => {
      // console.log(payload);
      state.user.profile = payload;
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