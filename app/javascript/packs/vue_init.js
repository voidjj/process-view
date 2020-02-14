import TurbolinksAdapter from 'vue-turbolinks'
import Vue from 'vue/dist/vue.esm'
import App from '../app.vue'
import ActionCable from 'actioncable'

Vue.use(TurbolinksAdapter)
Vue.prototype.$cable = ActionCable.createConsumer('/cable')
Vue.component('stream-output', App)

document.addEventListener('turbolinks:load', () => {
  const app = new Vue({
    el: '[data-behavior="vue"]',
  })
})
