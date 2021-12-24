<template>
  <div>
    <q-input outlined v-model="titleComputed" :label="label" />
  </div>
</template>

<script lang="ts">
import { defineComponent, toRefs, computed } from 'vue'

export default defineComponent({
  name: 'MainInput',
  props: {
    /** タイトル */
    title: String,
    label: String
  },
  emits: ['update:title'],
  setup (props, { emit }) {
    const { title } = toRefs(props)
    const titleComputed = computed({
      get: () => title.value,
      set: value => {
        emit('update:title', value)
      }
    })

    return {
      titleComputed
    }
  }
})
</script>
