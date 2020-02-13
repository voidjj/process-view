import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'

Vue.use(TurbolinksAdapter)

//import ActionCable from 'actioncable'
//Vue.prototype.$cable = ActionCable.createConsumer('/cable')

Vue.component('app', App)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '[data-behavior="vue"]',
  })
})
