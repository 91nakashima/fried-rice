<template>
  <q-layout view="lHh Lpr lFf">
    <q-header elevated>
      <q-toolbar>
        <q-toolbar-title>
          ちゃーはんの作り方
        </q-toolbar-title>
      </q-toolbar>
    </q-header>

    <q-page-container>
      <!-- <router-view /> -->
      <Test />
      <div v-for="m in drawerState" :key="m.id">
        <div>{{ m.id }} ： {{ m.msg }}</div>
      </div>
    </q-page-container>
  </q-layout>
</template>

<script lang="ts">
import { defineComponent, ref, computed } from 'vue'
import { useStore } from 'vuex'

export default defineComponent({
  name: 'MainLayout',

  setup () {
    const leftDrawerOpen = ref(false)

    const $store: any = useStore()

    const drawerState: any = computed({
      get: () => $store.getters['M_Message/getMessageData'],
      set: () => {
        $store.dispatch('M_Message/getDocs')
      }
    })

    return {
      leftDrawerOpen,
      drawerState,
      toggleLeftDrawer () {
        leftDrawerOpen.value = !leftDrawerOpen.value
      }
    }
  }
})
</script>
