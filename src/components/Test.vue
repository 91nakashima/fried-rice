<template>
  <div>
    {{ title }}
  </div>
</template>

<script lang="ts">
import { defineComponent } from 'vue'

export default defineComponent({
  name: 'Test',
  props: {
    title: {
      type: String,
      default: 'こんにちは'
    }
  }
})
</script>
