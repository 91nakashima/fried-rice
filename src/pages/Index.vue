<template>
  <div class="_page">
    <q-btn
      color="white"
      text-color="black"
      label="swift画面に遷移"
      class="_to_btn"
      @click="funTest"
    />
  </div>
</template>

<style lang="sass" scoped>
// $
._page
  display: flex
  justify-content: center
  padding: 50px
</style>

<script lang="ts">
import { defineComponent, ref, onMounted } from 'vue'
import Echo from '../model/customPlugin'

export default defineComponent({
  name: 'PageIndex',

  setup () {
    const funTest = () => {
      Echo.toNativePage({ value: location.href })
    }
    return {
      funTest
    }
  }
})
</script>
