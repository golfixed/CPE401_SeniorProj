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
        return import('../views/Classrooms.vue')
      }
    }
  },
  {
    path: '/login',
    name: 'Login',
    component: () => import('../views/Signin.vue'),
  },
  {
    path: '/logout',
    name: 'Logout',
    component: () => import('../views/Welcome.vue'),
  },
  {
    path: '/register',
    name: 'Regis',
    component: () => import(  '../views/Register.vue'),
  },
  // {
  //   path: '/classrooms',
  //   name: 'Classrooms',
  //   component: () => import('../views/Classrooms.vue')
  // },
  {
    path: '/classrooms/:id',
    name: 'ClassroomPage',
    component: () => import(  '../views/ClassPage.vue')
  },
  {
    path: '/classrooms/:id/member',
    name: 'ClassroomMember',
    component: () => import(  '../views/ClassMembers.vue')
  },
  {
    path: '/classrooms/post/:id',
    name: 'ClassroomPost',
    component: () => import(  '../views/PostPage.vue')
  },
  {
    path: '/createclass',
    name: 'CreateClassroom',
    component: () => import(  '../views/CreateClassroom.vue')
  },
  {
    path: '/createpost/:id',
    name: 'CreatePost',
    component: () => import(  '../views/CreatePost.vue')
  },
  {
    path: '/createpoll/:id',
    name: 'CreatePoll',
    component: () => import(  '../views/CreatePoll.vue')
  },
  // {
  //   path: '/chats',
  //   name: 'Chats',
  //   component: () => import( '../views/Chats.vue')
  // },
  {
    path: '/profile/:id',
    name: 'UserProfile',
    component: () => import( '../views/UserProfile.vue')
  },
  {
    path: '/search',
    name: 'Search',
    component: () => import( '../views/Search.vue')
  },
  {
    path: '/announce',
    name: 'Announcement',
    component: () => import(  '../views/Announcement.vue')
  },
  {
    path: '/settings',
    name: 'Settings',
    component: () => import( '../views/Settings.vue')
  },
  {
    path: '/notification',
    name: 'Notification',
    component: () => import( '../views/Notification.vue')
  },
  {
    path: '/settings/profile',
    name: 'Settings Profile',
    component: () => import(  '../views/Settings/Profile.vue')
  },
  {
    path: '/settings/account',
    name: 'Settings Account',
    component: () => import( '../views/Settings/Account.vue')
  },
  {
    path: '/settings/notification',
    name: 'Settings Notification',
    component: () => import('../views/Settings/Notification.vue')
  },
  { path: '*', redirect: '/' }
]

const router = new VueRouter({
  routes
})

export default router