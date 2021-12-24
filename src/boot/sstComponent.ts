import Test from '../components/Test.vue'
import MainInput from '../components/MainInput.vue'

export default ({ app }: any) => {
  app.component('Test', Test)
  app.component('MainInput', MainInput)
}
