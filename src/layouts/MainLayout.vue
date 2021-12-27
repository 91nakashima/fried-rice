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
import { defineComponent, ref, computed, ComputedRef } from 'vue'
import { useStore } from 'vuex'

const init = () => {
  const d_Input = ref<string>('')
  const leftDrawerOpen = ref<boolean>(false)

  return {
    d_Input,
    leftDrawerOpen
  }
}

type mainData = {
  id: string
  msg: string
  created_at: any
  created_by: string | undefined
  updated_at: any
  updated_by: string
}

export default defineComponent({
  name: 'MainLayout',

  setup () {
    const { d_Input, leftDrawerOpen } = init()

    const $store: any = useStore()

    const drawerState: ComputedRef<Array<mainData>> = computed(
      () => $store.getters['M_Message/getMessageData'] || []
    )

    drawerState.value.sort(
      (a: mainData, b: mainData) => a.created_at - b.created_at
    )

    const setData: any = () => {
      $store.dispatch('M_Message/setDocs', {
        msg: d_Input.value
      })
    }
    d_Input.value = ''

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
