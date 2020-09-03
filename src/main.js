import Vue from 'vue'
import App from './App.vue'
import vuetify from './plugins/vuetify'
import VueRouter from 'vue-router'
import {routes} from './routes.js'
import {store} from './store/store'
import dynamicTitle from './dynamicTitle' 
import axios from 'axios'

Vue.mixin(dynamicTitle)
Vue.config.productionTip = false
axios.defaults.baseURL="http://localhost:80/src/assets/php/"
Vue.use(VueRouter)
export const router = new VueRouter({
  routes,
  mode : "history",
  scrollBehavior(to,from,savedPosition){
    if(to.hash){
      return{
        selector: to.hash
      }
    }
    if (savedPosition) {
      return savedPosition
    } else {
      return { x: 0, y: 0 }
    }
}
})

export const eventBus = new Vue()

new Vue({
  vuetify,
  router,
  store,
  render: h => h(App)
}).$mount('#app')
