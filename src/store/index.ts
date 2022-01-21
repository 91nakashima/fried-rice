import { store } from 'quasar/wrappers'
// import { initFirebase } from './initfirebase'
import { createStore } from 'vuex'
import { createApp } from 'vue'
import App from '../App.vue'
import { setmodules } from './modules/setmodules'

const storeData = {
  plugins: [],
  modules: setmodules()
}

const app = createApp({ App })
const Store = createStore(storeData)
app.use(Store)
// initFirebase()

export interface StateInterface {
  example: unknown
}

export default store(() => Store)
