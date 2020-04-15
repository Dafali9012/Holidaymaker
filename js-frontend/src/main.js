import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
require('../public/style.css')
import 'bootstrap'; 
import 'bootstrap/dist/css/bootstrap.min.css';


Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
