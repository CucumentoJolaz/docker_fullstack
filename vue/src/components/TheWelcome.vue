<script setup>
import WelcomeItem from '@/components/WelcomeItem.vue'
import DocumentationIcon from './icons/IconDocumentation.vue'
import ToolingIcon from './icons/IconTooling.vue'
import EcosystemIcon from './icons/IconEcosystem.vue'
import CommunityIcon from './icons/IconCommunity.vue'
import SupportIcon from './icons/IconSupport.vue'
import {onMounted} from "vue";
import {ref} from 'vue'
import axios from "axios";

let info = ref(null)
let loading = ref(true)
let errored = ref(false)

let infoUsers = ref(null)
let loadingUsers = ref(true)
let erroredUsers = ref(false)

function initialiseBitcoinData() {
  axios
      .get('https://api.coindesk.com/v1/bpi/currentprice.json')
      .then(response => {
        info.value = response.data.bpi;
      })
      .catch(error => {
        console.log(error);
        errored.value = true;
      })
      .finally(() => (loading.value = false));
}
function initialiseUsers() {
  axios
      .get('http://localhost:8088/users/?format=json')
      .then(response => {
        infoUsers.value = response.data;
      })
      .catch(error => {
        console.log(error);
        erroredUsers.value = true;
      })
      .finally(() => (loadingUsers.value = false));
}


function currencyDecimal(value) {
  return value.toFixed(2)
}

onMounted(() => {
  initialiseBitcoinData()
  initialiseUsers()
})

</script>

<template>
  <WelcomeItem>
    <template #icon>
      <DocumentationIcon/>
    </template>
    <template #heading>Documentation</template>

    Vue’s
    <a href="https://vuejs.org/" target="_blank" rel="noopener">official documentation</a>
    provides you with all information you need to get started.
  </WelcomeItem>

  <WelcomeItem>
    <template #icon>
      <ToolingIcon/>
    </template>
    <template #heading>Tooling</template>

    This project is served and bundled with
    <a href="https://vitejs.dev/guide/features.html" target="_blank" rel="noopener">Vite</a>. The
    recommended IDE setup is
    <a href="https://code.visualstudio.com/" target="_blank" rel="noopener">VSCode</a> +
    <a href="https://github.com/johnsoncodehk/volar" target="_blank" rel="noopener">Volar</a>. If
    you need to test your components and web pages, check out
    <a href="https://www.cypress.io/" target="_blank" rel="noopener">Cypress</a> and
    <a href="https://on.cypress.io/component" target="_blank">Cypress Component Testing</a>.

    <br/>

    More instructions are available in <code>README.md</code>.
  </WelcomeItem>

  <WelcomeItem>
    <template #icon>
      <EcosystemIcon/>
    </template>
    <template #heading>Ecosystem</template>

    Get official tools and libraries for your project:
    <a href="https://pinia.vuejs.org/" target="_blank" rel="noopener">Pinia</a>,
    <a href="https://router.vuejs.org/" target="_blank" rel="noopener">Vue Router</a>,
    <a href="https://test-utils.vuejs.org/" target="_blank" rel="noopener">Vue Test Utils</a>, and
    <a href="https://github.com/vuejs/devtools" target="_blank" rel="noopener">Vue Dev Tools</a>. If
    you need more resources, we suggest paying
    <a href="https://github.com/vuejs/awesome-vue" target="_blank" rel="noopener">Awesome Vue</a>
    a visit.
  </WelcomeItem>

  <WelcomeItem>
    <template #icon>
      <CommunityIcon/>
    </template>
    <template #heading>Community</template>

    Got stuck? Ask your question on
    <a href="https://chat.vuejs.org" target="_blank" rel="noopener">Vue Land</a>, our official
    Discord server, or
    <a href="https://stackoverflow.com/questions/tagged/vue.js" target="_blank" rel="noopener"
    >StackOverflow</a
    >. You should also subscribe to
    <a href="https://news.vuejs.org" target="_blank" rel="noopener">our mailing list</a> and follow
    the official
    <a href="https://twitter.com/vuejs" target="_blank" rel="noopener">@vuejs</a>
    twitter account for latest news in the Vue world.
  </WelcomeItem>

  <WelcomeItem>
    <template #icon>
      <SupportIcon/>
    </template>
    <template #heading>Support Vue</template>

    As an independent project, Vue relies on community backing for its sustainability. You can help
    us by
    <a href="https://vuejs.org/sponsor/" target="_blank" rel="noopener">becoming a sponsor</a>.
  </WelcomeItem>

  <WelcomeItem>
    <template #icon>
      <SupportIcon/>
    </template>
    <template #heading>Test API</template>
    <div v-if="loading">Loading...</div>
    <div
        v-else
        v-for="currency in info"
        class="currency"
    >
      {{ currency.description }}:
      <span class="lighten">
        <span v-html="currency.symbol"></span>{{ currencyDecimal(currency.rate_float )}}
      </span>
    </div>
  </WelcomeItem>

   <WelcomeItem>
    <template #icon>
      <EcosystemIcon/>
    </template>
    <template #heading>Custom API test</template>
    <div v-if="loadingUsers">Loading...</div>
    <div
        v-else
        v-for="user in infoUsers.results"
        class="user"
    >
      {{ user.username }}:
      <span class="lighten">
        {{ user.email }}
      </span>
      {{ user.groups }}
    </div>
  </WelcomeItem>
</template>




