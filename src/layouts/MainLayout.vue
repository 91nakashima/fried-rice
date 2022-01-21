<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-toolbar-title>
          Quasar
        </q-toolbar-title>
      </q-toolbar>
    </q-header>

    <q-page-container>
      <router-view />
    </q-page-container>
  </q-layout>
</template>

<script lang="ts">
import { defineComponent, ref } from 'vue'

const init = () => {
  const d_Input = ref<string>('')
  const leftDrawerOpen = ref<boolean>(false)

  return {
    d_Input,
    leftDrawerOpen
  }
}

export default defineComponent({
  name: 'MainLayout',

  setup () {
    return {}
  }
})
</script>
