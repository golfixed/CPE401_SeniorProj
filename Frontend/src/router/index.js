import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)
var isToken = localStorage.token;
var isUser = localStorage.user;


const routes = [
  {
    path: '/',
    name: 'Welcome',
    component: function () {
      if (isToken == undefined || isUser == undefined) {
        localStorage.clear();
        return import('../views/Welcome.vue')
      } else {
        return import('../views/Home.vue')
      }
    }
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import( /* webpackChunkName: "Login" */ '../views/Login.vue'),
  },
  {
    path: '/logout',
    name: 'Logout',
    component: () => import( /* webpackChunkName: "Login" */ '../views/Welcome.vue'),
  },
  {
    path: '/register',
    name: 'Regis',
    component: () => import( /* webpackChunkName: "Regis" */ '../views/Register.vue'),
  },
  {
    path: '/classrooms',
    name: 'Classrooms',
    component: () => import( /* webpackChunkName: "Classrooms" */ '../views/Classrooms.vue')
  },
  {
    path: '/chats',
    name: 'Chats',
    component: () => import( /* webpackChunkName: "Chats" */ '../views/Chats.vue')
  },
  {
    path: '/search',
    name: 'Search',
    component: () => import( /* webpackChunkName: "Search" */ '../views/Search.vue')
  },
  {
    path: '/announce',
    name: 'Announcement',
    component: () => import( /* webpackChunkName: "Announcement" */ '../views/Announcement.vue')
  },
  {
    path: '/settings',
    name: 'Settings',
    component: () => import( /* webpackChunkName: "Settings" */ '../views/Settings.vue')
  },
  {
    path: '/notification',
    name: 'Notification',
    component: () => import( /* webpackChunkName: "Settings" */ '../views/Notification.vue')
  },
  {
    path: '/settings/profile',
    name: 'Settings Profile',
    component: () => import( /* webpackChunkName: "Settings" */ '../views/Settings/Profile.vue')
  },
  {
    path: '/settings/account',
    name: 'Settings Account',
    component: () => import( /* webpackChunkName: "Settings" */ '../views/Settings/Account.vue')
  },
  {
    path: '/settings/notification',
    name: 'Settings Notification',
    component: () => import( /* webpackChunkName: "Settings" */ '../views/Settings/Notification.vue')
  },
  { path: '*', redirect: '/' }
]

const router = new VueRouter({
  routes
})

export default router