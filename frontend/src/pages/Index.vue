<template>
  <q-page class="row items-center justify-evenly">
    <!-- <example-component
      title="Example component"
      active
      :todos="todos"
      :meta="meta"
    ></example-component> -->
    <led-color-controller>
    </led-color-controller>
  </q-page>
</template>

<script lang="ts">
import { defineComponent } from 'vue';
import LedColorController from '../components/LedColorController.vue';

export default defineComponent({
  name: 'PageIndex',
  components: {LedColorController  },
  setup() {
    return { };
  }
});
</script>
