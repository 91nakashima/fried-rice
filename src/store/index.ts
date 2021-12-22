import { store } from 'quasar/wrappers'
import { initFirebase } from './initfirebase'
import { createStore } from 'vuex'
import { createApp } from 'vue'
import App from '../App.vue'

import Message from './modules/M_Message'

export interface StateInterface {
  example: unknown
}

const app = createApp({ App })

const Store = createStore({
  plugins: [],
  modules: { M_Message: Message }
})

app.use(Store)

initFirebase().catch(error => {
  console.log(error)
})

export default store(() => {
  return Store
})
