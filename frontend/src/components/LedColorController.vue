<template>
    <div class="q-pa-md">
        <q-badge color="grey-3" text-color="black" class="q-mb-sm">
            {{ rgb }}
        </q-badge>

        <q-color
            :model-value="rgb"
            @change="val => onColorChange(val)"
            style="max-width: 250px"
            no-footer
            no-header-tabs
        />
  </div>
</template>

<script lang="ts">

import {
  defineComponent,
  ref
} from 'vue';
import axios from 'axios';
import { useQuasar } from 'quasar'

export default defineComponent({
    name: 'CompositionComponent',
    setup() {
        const $q = useQuasar()
        let rgb = ref('rgb(0, 0, 0)')

        const onColorChange = (color: string) => {
            rgb.value = color
            const colors = /rgb\(([\d]{1,3})\,([\d]{1,3})\,([\d]{1,3})\)/g.exec(rgb.value)
            if (colors && colors.length === 4) {
                const payload = {
                    R: Number(colors[1]),
                    G: Number(colors[2]),
                    B: Number(colors[3])
                }
                axios.post('/color', payload)
                .then( response => { 
                    const {
                        result,
                        msg = 'N/A'
                    } = response.data as {
                        result: string,
                        msg: string
                    }
                    if(result === 'ok') {
                        $q.notify({
                            message: 'Success',
                            timeout: 1000,
                        })
                    } else {
                        $q.notify({
                            message: `Fail, ${msg}`,
                            timeout: 1000,
                        })
                    }
                 } )
                .catch( response => { 
                    $q.notify({
                        message: 'Unknown error',
                        timeout: 1000,
                    })
                    console.error(response)
                });
            } else {

            }
        }

        return { 
            rgb,
            onColorChange
        };
    },
});
</script>