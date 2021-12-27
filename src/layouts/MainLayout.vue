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
      <MainInput label="メッセージ" v-model:title="d_Input" />
      <q-btn @click="setData" label="保存" />
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

const init = () => {
  const d_Input = ref('')
  const leftDrawerOpen = ref(false)

  return {
    d_Input,
    leftDrawerOpen
  }
}

export default defineComponent({
  name: 'MainLayout',

  setup () {
    const { d_Input, leftDrawerOpen } = init()

    const $store: any = useStore()

    const drawerState: any = computed({
      get: () => $store.getters['M_Message/getMessageData'],
      set: () => {
        $store.dispatch('M_Message/getDocs')
      }
    })

    const setData: any = () => {
      $store.dispatch('M_Message/setDocs', {
        msg: d_Input.value
      })
    }

    return {
      d_Input,
      setData, // 保存
      leftDrawerOpen,
      drawerState,
      toggleLeftDrawer () {
        leftDrawerOpen.value = !leftDrawerOpen.value
      }
    }
  }
})
</script>
