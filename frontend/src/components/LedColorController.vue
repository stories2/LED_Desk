<template>
    <div class="container">
        <div class="row">
            <div class="col">
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
            </div>
        </div>
        <div class="row">
            <div class="col text-center">
                <q-btn outline rounded color="primary"
                    :label="lightSwitch"
                    @click="onTurnOnOffBtnClicked()"
                />
            </div>
        </div>
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
        let rgb = ref('rgb(0,0,0)')
        let lightSwitch = ref('Turn on')

        const sendColorChangeReq = (rgb: string) => {
            const colors = /rgb\(([\d]{1,3})\,([\d]{1,3})\,([\d]{1,3})\)/g.exec(rgb)
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
                $q.notify({
                    message: 'Unknown color detected.',
                    timeout: 1000,
                })
            }
        }

        const onTurnOnOffBtnClicked = () => {
            if (rgb.value === 'rgb(0,0,0)') {
                lightSwitch.value = 'Turn off'
                rgb.value = 'rgb(255,255,255)'
            } else {
                lightSwitch.value = 'Turn on'
                rgb.value = 'rgb(0,0,0)'
            }
            
            sendColorChangeReq(rgb.value)
        }

        const onColorChange = (color: string) => {
            rgb.value = color
            
            if (rgb.value === 'rgb(0,0,0)') {
                lightSwitch.value = 'Turn on'
            } else {
                lightSwitch.value = 'Turn off'
            }
            
            sendColorChangeReq(rgb.value)
        }

        return { 
            rgb,
            onColorChange,
            lightSwitch,
            onTurnOnOffBtnClicked
        };
    },
});
</script>