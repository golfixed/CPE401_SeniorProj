import Vue from 'vue'
import VueRouter from 'vue-router'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Welcome',
    component:  () => import( /* webpackChunkName: "Welcome" */ '../views/Welcome.vue')
  },
  {
    path: '/login',
    name: 'Login',
    component:  () => import( /* webpackChunkName: "Login" */ '../views/login.vue')
  },
  {
    path: '/regis',
    name: 'Regis',
    component:  () => import( /* webpackChunkName: "Regis" */ '../views/regis.vue')
  },
  {
    path: '/home',
    name: 'Home',
    component:  () => import( /* webpackChunkName: "Home" */ '../views/Home.vue')
  },
  // {
  //   path: '/classrooms',
  //   name: 'Classrooms',
  //   component:  () => import( /* webpackChunkName: "Classrooms" */ '../views/Classroom.vue')
  // },
  // {
  //   path: '/Chat',
  //   name: 'Chats',
  //   component:  () => import( /* webpackChunkName: "Chats" */ '../views/Classroom.vue')
  // },
]

const router = new VueRouter({
  routes
})

export default router