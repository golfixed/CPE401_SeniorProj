import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: () => ({
    searchPageOpen: false,
    // loggedIn: false,
    selected_ancmt: {},
    optionMenuOpen: false,
    optionMenu: {
      home: false,
      classrooms: false,
      classpage: false,
      settings: false,
    },
    assistModal: false,
    modal:{
      overlay: false,
      PINcode: false,
    },
    overlayShow: false,
    currentClassInfo: {},
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
    Open_optionMenu: (state, payload) => {
      if(payload == 'home') {
        state.optionMenu.home = true;
      } else if (payload == 'classrooms'){
        state.optionMenu.classrooms = true;
      } else if (payload == 'classpage'){
        state.optionMenu.classpage = true;
      } else if (payload == 'settings') {
        state.optionMenu.settings = true;
      }
      state.overlayShow = true;
      state.optionMenuOpen = true;
    },
    Close_AllMenu: (state) => {
      state.optionMenuOpen = false;
      state.optionMenu.home = false;
      state.optionMenu.classrooms = false;
      state.optionMenu.classpage = false;
      state.optionMenu.settings = false;
      state.overlayShow = false;
      state.assistModal = false;
      state.modal.PINcode = false;
      state.modal.overlay = false;
    },
    Open_assistMenu: (state) => {
      state.assistModal = true;
      state.overlayShow = true;

    },
    OpenModal: (state, payload)=>{
      state.modal.overlay = true;
      if (payload == 'pincode') state.modal.PINcode = true;
    },
    Update_CurrentViewClass: (state, payload) => {
      state.currentClassInfo = payload;
    }
  },
  actions: {},
  modules: {}
})