<template>
  <v-app>
    <LoadingScreen v-if="isLoading"></LoadingScreen>
    <v-app-bar v-else app flat fixed>
      <v-tabs id="tabs" v-model="tab" center-active show-arrows hide-slider>
        <v-tab v-for="day in days" :key="day.content.id">
          {{ day.tabId }}
        </v-tab>
      </v-tabs>
    </v-app-bar>

    <v-main>
      <v-tabs-items v-model="tab">
        <v-tab-item v-for="day in days" :key="day.content.id">
          <div id="dayTheme">
            <h1 id="title">
              <a :href="day.theme.link" target="_blank">
                {{ day.theme.title }}
              </a>
            </h1>
            <div class="scroll">
              <v-btn class="scroll-btn" fab>
                <v-icon size="2rem" @click="scrollTo('#grid')">
                  mdi-chevron-down
                </v-icon>
              </v-btn>
            </div>
            <v-spacer />
          </div>
          <Grid ref="grid" :dayContent="day.content"></Grid>
          <div class="scroll my-4">
            <v-btn class="scroll-btn" fab>
              <v-icon size="2rem" @click="scrollTo('#dayTheme')">
                mdi-chevron-up
              </v-icon>
            </v-btn>
          </div>
        </v-tab-item>
      </v-tabs-items>
    </v-main>

    <v-footer app flat absolute padless>
      <v-col class="text-center" cols="12">
        {{ new Date().getFullYear() }} — Ippon Technologies
      </v-col>
    </v-footer>
  </v-app>
</template>

<script>
import LoadingScreen from "./components/LoadingScreen.vue";
import Grid from "./components/Grid.vue";

export default {
  name: "App",
  components: { LoadingScreen, Grid },
  data() {
    return {
      isLoading: true,
      tab: null,
      days: [
        {
          tabId: 1,
          theme: {
            title: "Les musiques qui rappellent l'été",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/JDglMK9sgIQ" },
            { id: 2, link: "https://www.youtube.com/embed/YqeW9_5kURI" },
            { id: 3, link: "https://www.youtube.com/embed/nkoKGu8JzKE" },
            { id: 4, link: "https://www.youtube.com/embed/5NV6Rdv1a3I" },
            { id: 5, link: "https://www.youtube.com/embed/apBWI6xrbLY" },
            { id: 6, link: "https://www.youtube.com/embed/_om0W6xzQd8" },
            { id: 7, link: "https://www.youtube.com/embed/1YRW1QRKTBc" },
            { id: 8, link: "https://www.youtube.com/embed/7yCaNt9qRek" },
            { id: 9, link: "https://www.youtube.com/embed/pK060iUFWXg" },
            { id: 10, link: "https://www.youtube.com/embed/pRpeEdMmmQ0" },
            { id: 11, link: "https://www.youtube.com/embed/KOOhPfMbuIQ" },
            { id: 12, link: "https://www.youtube.com/embed/voQhp1K2TSk" },
            { id: 13, link: "https://www.youtube.com/embed/YKbuj_2IU44" },
            { id: 14, link: "https://www.youtube.com/embed/Kep479rwwJo" },
            { id: 15, link: "https://www.youtube.com/embed/AOOyuDLnA7I" },
            { id: 16, link: "https://www.youtube.com/embed/zUptsdVZ9EA" },
            { id: 17, link: "https://www.youtube.com/embed/-CVn3-3g_BI" },
            { id: 18, link: "https://www.youtube.com/embed/P6Mkertj4Hc" },
            { id: 19, link: "https://www.youtube.com/embed/iD2xL3qqV7o" },
            { id: 20, link: "https://www.youtube.com/embed/8CKuWPRq2Ps" },
            { id: 21, link: "https://www.youtube.com/embed/3bCpUWeXjag" },
            { id: 22, link: "https://www.youtube.com/embed/9YicQtP-xyg" },
            { id: 23, link: "https://www.youtube.com/embed/SPlQpGeTbIE" },
            { id: 24, link: "https://www.youtube.com/embed/tX66IUZuQnY" },
            { id: 25, link: "https://www.youtube.com/embed/rUFgacK8sZ0" }
          ]
        },
        {
          tabId: 2,
          theme: {
            title: "Les chansons les plus chill",
            link:
              "https://www.youtube.com/watch?v=ahsFa6AYRaQ&list=PLQGYwOtPkncZc2EeLmegIH9936YRXYevM"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/ahsFa6AYRaQ" },
            { id: 2, link: "https://www.youtube.com/embed/fLexgOxsZu0" },
            { id: 3, link: "https://www.youtube.com/embed/FZK9Zi26Izc" },
            { id: 4, link: "https://www.youtube.com/embed/JsD6uEZsIsU" },
            { id: 5, link: "https://www.youtube.com/embed/DG4JMKzpe8g" },
            { id: 6, link: "https://www.youtube.com/embed/UPnMFUsKm8w" },
            { id: 7, link: "https://www.youtube.com/embed/jZHLXzGwo5w" },
            { id: 8, link: "https://www.youtube.com/embed/5wH3noQ3Jso" },
            { id: 9, link: "https://www.youtube.com/embed/IZiC0ms8gDs" },
            { id: 10, link: "https://www.youtube.com/embed/I32EQJlRq_0" },
            { id: 11, link: "https://www.youtube.com/embed/COz9lDCFHjw" },
            { id: 12, link: "https://www.youtube.com/embed/1LXsm9y-z3I" },
            { id: 13, link: "https://www.youtube.com/embed/NIBKwPA04tM" },
            { id: 14, link: "https://www.youtube.com/embed/8zz5o3TLzlM" },
            { id: 15, link: "https://www.youtube.com/embed/OKMyqcTXxrM" },
            { id: 16, link: "https://www.youtube.com/embed/Zz-DJr1Qs54" },
            { id: 17, link: "https://www.youtube.com/embed/EHpmh5ZhzYE" },
            { id: 18, link: "https://www.youtube.com/embed/KOIJ9P9mUF0" },
            { id: 19, link: "https://www.youtube.com/embed/LanCLS_hIo4" },
            { id: 20, link: "https://www.youtube.com/embed/50VNCymT-Cs" },
            { id: 21, link: "https://www.youtube.com/embed/9xc91V8ZmBA" },
            { id: 22, link: "https://www.youtube.com/embed/tI1uTVaCGDE" },
            { id: 23, link: "https://www.youtube.com/embed/1hrgT_ZDUvs" },
            { id: 24, link: "https://www.youtube.com/embed/VCXOuoVkhUY" },
            { id: 25, link: "https://www.youtube.com/embed/eMKqjO1jyGU" },
            { id: 26, link: "https://www.youtube.com/embed/5hNT2wtVIBI" },
            { id: 27, link: "https://www.youtube.com/embed/xn_1hFdE-5g" }
          ]
        },
        {
          tabId: 3,
          theme: {
            title: "Les musiques de films ou de séries",
            link:
              "https://www.youtube.com/watch?v=kOYcbod5J0w&list=PLQGYwOtPkncbVM8Kvq8pwiXcNWcwKO331"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/kOYcbod5J0w" },
            { id: 2, link: "https://www.youtube.com/embed/DeumyOzKqgI" },
            { id: 3, link: "https://www.youtube.com/embed/nOE24dd0Xmc" },
            { id: 4, link: "https://www.youtube.com/embed/PhJnpbicLnk" },
            { id: 5, link: "https://www.youtube.com/embed/I-YYZiJvwpc" },
            { id: 6, link: "https://www.youtube.com/embed/joxyFDmh_LY" },
            { id: 7, link: "https://www.youtube.com/embed/KGD2N5hJ2e0" },
            { id: 8, link: "https://www.youtube.com/embed/F1oHBcTdKL4" },
            { id: 9, link: "https://www.youtube.com/embed/calah3bUM7g" },
            { id: 10, link: "https://www.youtube.com/embed/NB4SuVwCgJ8" },
            { id: 11, link: "https://www.youtube.com/embed/SjkJFKe4-iQ" },
            { id: 12, link: "https://www.youtube.com/embed/9AN04imFDK8" },
            { id: 13, link: "https://www.youtube.com/embed/L_jWHffIx5E" },
            { id: 14, link: "https://www.youtube.com/embed/pFS4zYWxzNA" },
            { id: 15, link: "https://www.youtube.com/embed/-yOZEiHLuVU" },
            { id: 16, link: "https://www.youtube.com/embed/Hl5F9AFXQ-M" },
            { id: 17, link: "https://www.youtube.com/embed/TgokkAeg8mg" },
            { id: 18, link: "https://www.youtube.com/embed/94-PAIMDhaQ" },
            { id: 19, link: "https://www.youtube.com/embed/_Yhyp-_hX2s" },
            { id: 20, link: "https://www.youtube.com/embed/IujUFrlme9Q" },
            { id: 21, link: "https://www.youtube.com/embed/ZxJrdCIejus" },
            { id: 22, link: "https://www.youtube.com/embed/8CdcCD5V-d8" },
            { id: 23, link: "https://www.youtube.com/embed/ZFL0REtkocY" },
            { id: 24, link: "https://www.youtube.com/embed/p4zluA60hjs" },
            { id: 25, link: "https://www.youtube.com/embed/D8zlUUrFK-M" },
            { id: 26, link: "https://www.youtube.com/embed/BEm0AjTbsac" },
            { id: 27, link: "https://www.youtube.com/embed/CaM__ljqHyo" },
            { id: 28, link: "https://www.youtube.com/embed/qrrz54UtkCc" }
          ]
        },
        {
          tabId: 4,
          theme: {
            title: "S'il devait n'y avoir qu'une chanson",
            link:
              "https://www.youtube.com/watch?v=v9BtXaiLVA0&list=PLQGYwOtPkncbXESuDxOqIfwdfZmFSUVyw"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/v9BtXaiLVA0" },
            { id: 2, link: "https://www.youtube.com/embed/IeDMnyQzS88" },
            { id: 3, link: "https://www.youtube.com/embed/twqM56f_cVo" },
            { id: 4, link: "https://www.youtube.com/embed/uZmJ-4nRrIs" },
            { id: 5, link: "https://www.youtube.com/embed/0Fy7opKu46c" },
            { id: 6, link: "https://www.youtube.com/embed/ZuI61cTNbAk" },
            { id: 7, link: "https://www.youtube.com/embed/82NUfPBHxYs" },
            { id: 8, link: "https://www.youtube.com/embed/CSD2J8yaMmM" },
            { id: 9, link: "https://www.youtube.com/embed/LviBwdfLn2Q" },
            { id: 10, link: "https://www.youtube.com/embed/BR6pYICqZT0" },
            { id: 11, link: "https://www.youtube.com/embed/xMfz1jlyQrw" },
            { id: 12, link: "https://www.youtube.com/embed/Uq0aeEYLkIE" },
            { id: 13, link: "https://www.youtube.com/embed/i19d1QnstsA" },
            { id: 14, link: "https://www.youtube.com/embed/IcLnFAEia9c" },
            { id: 15, link: "https://www.youtube.com/embed/wqCpjFMvz-k" },
            { id: 16, link: "https://www.youtube.com/embed/dX3k_QDnzHE" },
            { id: 17, link: "https://www.youtube.com/embed/tKi9Z-f6qX4" },
            { id: 18, link: "https://www.youtube.com/embed/-sixBbRDw6w" },
            { id: 19, link: "https://www.youtube.com/embed/PBwAxmrE194" }
          ]
        },
        {
          tabId: 5,
          theme: {
            title: "Les chansons de la honte",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/87gWaABqGYs" },
            { id: 2, link: "https://www.youtube.com/embed/x-VYdBKwSLc" },
            { id: 3, link: "https://www.youtube.com/embed/8_YCbPbV-CM" },
            { id: 4, link: "https://www.youtube.com/embed/QcvGo19imWg" },
            { id: 5, link: "https://www.youtube.com/embed/elueA2rofoo" },
            { id: 6, link: "https://www.youtube.com/embed/n3XJRk8Cyag" },
            { id: 7, link: "https://www.youtube.com/embed/agrXgrAgQ0U" },
            { id: 8, link: "https://www.youtube.com/embed/YFKV13x3Ae4" },
            { id: 9, link: "https://www.youtube.com/embed/9GMAbl1Rz1k" },
            { id: 10, link: "https://www.youtube.com/embed/4bPGxLxogvw" },
            { id: 11, link: "https://www.youtube.com/embed/SRBFun4Vv8M" },
            { id: 12, link: "https://www.youtube.com/embed/EkGiGf8utCM" },
            { id: 13, link: "https://www.youtube.com/embed/xzZO5MazGGM" },
            { id: 14, link: "https://www.youtube.com/embed/6wAx0aDfxZQ" },
            { id: 15, link: "https://www.youtube.com/embed/XmjOdFZw8uc" },
            { id: 16, link: "https://www.youtube.com/embed/GuyvZp_cM0c" },
            { id: 17, link: "https://www.youtube.com/embed/QtOtMHQHcac" },
            { id: 18, link: "https://www.youtube.com/embed/vC8qJfVYxZY" },
            { id: 19, link: "https://www.youtube.com/embed/f4Mc-NYPHaQ" },
            { id: 20, link: "https://www.youtube.com/embed/TX_ZmBCldnQ" },
            { id: 21, link: "https://www.youtube.com/embed/vN81YuaLP6k" },
            { id: 22, link: "https://www.youtube.com/embed/tOzOD-82mW0" },
            { id: 23, link: "https://www.youtube.com/embed/wVSxShb8gZQ" },
            { id: 24, link: "https://www.youtube.com/embed/DmeUuoxyt_E" },
            { id: 25, link: "https://www.youtube.com/embed/rGe0PdW2ozw" }
          ]
        },
        {
          tabId: 6,
          theme: {
            title: "Les chansons de la motivation",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/Y8KeT6dlB2c" },
            { id: 2, link: "https://www.youtube.com/embed/_raonMRuT54" },
            { id: 3, link: "https://www.youtube.com/embed/JpxLaTsylBU" },
            { id: 4, link: "https://www.youtube.com/embed/27d138zhyZQ" },
            { id: 5, link: "https://www.youtube.com/embed/bAPqxiQpJpA" },
            { id: 6, link: "https://www.youtube.com/embed/d5dIubsID_M" },
            { id: 7, link: "https://www.youtube.com/embed/9mYtLuuBzQI" },
            { id: 8, link: "https://www.youtube.com/embed/h0chqsOCQDI" },
            { id: 9, link: "https://www.youtube.com/embed/ruuG2v88zSM" },
            { id: 10, link: "https://www.youtube.com/embed/jpqV3dzYOgk" },
            { id: 11, link: "https://www.youtube.com/embed/btPJPFnesV4" },
            { id: 12, link: "https://www.youtube.com/embed/fGx6K90TmCI" },
            { id: 13, link: "https://www.youtube.com/embed/KQ6zr6kCPj8" },
            { id: 14, link: "https://www.youtube.com/embed/MwPb7g_BlXQ" },
            { id: 15, link: "https://www.youtube.com/embed/W9DZuY_OPF8" },
            { id: 16, link: "https://www.youtube.com/embed/myaN5jTh79o" },
            { id: 17, link: "https://www.youtube.com/embed/4jIXcSxBP7U" },
            { id: 18, link: "https://www.youtube.com/embed/xjBTNbEXbAA" },
            { id: 19, link: "https://www.youtube.com/embed/4NQLmUOgT5M" },
            { id: 20, link: "https://www.youtube.com/embed/40JmEj0_aVM" },
            { id: 21, link: "https://www.youtube.com/embed/GGXzlRoNtHU" },
            { id: 22, link: "https://www.youtube.com/embed/v2AC41dglnM" }
          ]
        },
        {
          tabId: 7,
          theme: {
            title: "Les chansons pour danser toute la nuit",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/4G6QDNC4jPs" },
            { id: 2, link: "https://www.youtube.com/embed/l_S_gTnUzvg" },
            { id: 3, link: "https://www.youtube.com/embed/kJQP7kiw5Fk" },
            { id: 4, link: "https://www.youtube.com/embed/OC2R5fvJsxo" },
            { id: 5, link: "https://www.youtube.com/embed/5OAysfkcMjg" },
            { id: 6, link: "https://www.youtube.com/embed/iaGjz4dtr3o" },
            { id: 7, link: "https://www.youtube.com/embed/XHGkGE6b850" },
            { id: 8, link: "https://www.youtube.com/embed/9VQdVA2hjsA" },
            { id: 9, link: "https://www.youtube.com/embed/u9LH_y159sg" },
            { id: 10, link: "https://www.youtube.com/embed/bpEmjxobvbY" },
            { id: 11, link: "https://www.youtube.com/embed/uSD4vsh1zDA" },
            { id: 12, link: "https://www.youtube.com/embed/IhkuARmR8fs" },
            { id: 13, link: "https://www.youtube.com/embed/Lgs9QUtWc3M" },
            { id: 14, link: "https://www.youtube.com/embed/QtxlCsVKkvY" },
            { id: 15, link: "https://www.youtube.com/embed/BPdrGOFXzGA" },
            { id: 16, link: "https://www.youtube.com/embed/2OluGY9oPVA" },
            { id: 17, link: "https://www.youtube.com/embed/FLAUI6pSFSs" },
            { id: 18, link: "https://www.youtube.com/embed/5L6xyaeiV58" },
            { id: 19, link: "https://www.youtube.com/embed/wZv62ShoStY" },
            { id: 20, link: "https://www.youtube.com/embed/OP1Q1flNbVA" },
            { id: 21, link: "https://www.youtube.com/embed/QlPS16NeBO0" },
            { id: 22, link: "https://www.youtube.com/embed/tuK6n2Lkza0" },
            { id: 23, link: "https://www.youtube.com/embed/6Z66wVo7uNw" }
          ]
        },
        {
          tabId: 8,
          theme: {
            title: "Les chansons des années de naissance",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/dwDns8x3Jb4" },
            { id: 2, link: "https://www.youtube.com/embed/pw15SBOrOz8" },
            { id: 3, link: "https://www.youtube.com/embed/lcOxhH8N3Bo" },
            { id: 4, link: "https://www.youtube.com/embed/NKeU1twQYX4" },
            { id: 5, link: "https://www.youtube.com/embed/m3dQeNurXss" },
            { id: 6, link: "https://www.youtube.com/embed/ihyQf8mww3o" },
            { id: 7, link: "https://www.youtube.com/embed/KnFCNQUTgaU" },
            { id: 8, link: "https://www.youtube.com/embed/wmin5WkOuPw" },
            { id: 9, link: "https://www.youtube.com/embed/ijxk-fgcg7c" },
            { id: 10, link: "https://www.youtube.com/embed/sFvENQBc-F8" },
            { id: 11, link: "https://www.youtube.com/embed/ZyhrYis509A" },
            { id: 12, link: "https://www.youtube.com/embed/NKMtZm2YuBE" },
            { id: 13, link: "https://www.youtube.com/embed/DwrHwZyFN7M" },
            { id: 14, link: "https://www.youtube.com/embed/7374CZQoS2Y" },
            { id: 15, link: "https://www.youtube.com/embed/79fzeNUqQbQ" },
            { id: 16, link: "https://www.youtube.com/embed/_r0n9Dv6XnY" },
            { id: 17, link: "https://www.youtube.com/embed/JAHA4Jh5jkw" },
            { id: 18, link: "https://www.youtube.com/embed/L1N3WXZ_1LM" },
            { id: 19, link: "https://www.youtube.com/embed/WUaeNidruxs" },
            { id: 20, link: "https://www.youtube.com/embed/75MMjly5AjM" },
            { id: 21, link: "https://www.youtube.com/embed/I_2D8Eo15wE" },
            { id: 22, link: "https://www.youtube.com/embed/OMOGaugKpzs" },
            { id: 23, link: "https://www.youtube.com/embed/BtV1-gJ_bm0" },
            { id: 24, link: "https://www.youtube.com/embed/rMxeXTnrRV0" },
            { id: 25, link: "https://www.youtube.com/embed/8SbUC-UaAxE" },
            { id: 26, link: "https://www.youtube.com/embed/hkHF0xvQOok" },
            { id: 27, link: "https://www.youtube.com/embed/gJLIiF15wjQ" },
            { id: 28, link: "https://www.youtube.com/embed/4TYv2PhG89A" },
            { id: 29, link: "https://www.youtube.com/embed/Fcd3XuQwDQQ" },
            { id: 30, link: "https://www.youtube.com/embed/j5rGm3kdTuk" }
          ]
        },
        {
          tabId: 9,
          theme: {
            title: "Les meilleures reprises de chansons",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/W41szpiE3cQ" },
            { id: 2, link: "https://www.youtube.com/embed/8AHCfZTRGiI" },
            { id: 3, link: "https://www.youtube.com/embed/8K0EAc3abq8" },
            { id: 4, link: "https://www.youtube.com/embed/HxJhYpTIrl8" },
            { id: 5, link: "https://www.youtube.com/embed/y8AWFf7EAc4" },
            { id: 6, link: "https://www.youtube.com/embed/IbVoo7YLWnI" },
            { id: 7, link: "https://www.youtube.com/embed/Zx1_6F-nCaw" },
            { id: 8, link: "https://www.youtube.com/embed/eDEoC3Xr-fY" },
            { id: 9, link: "https://www.youtube.com/embed/m3lF2qEA2cw" },
            { id: 10, link: "https://www.youtube.com/embed/Yifz3X_i-F8" },
            { id: 11, link: "https://www.youtube.com/embed/qbMWw-kG9V4" },
            { id: 12, link: "https://www.youtube.com/embed/u9Dg-g7t2l4" },
            { id: 13, link: "https://www.youtube.com/embed/TB2Tp1IcoQQ" },
            { id: 14, link: "https://www.youtube.com/embed/fregObNcHC8" },
            { id: 15, link: "https://www.youtube.com/embed/o6rBK0BqL2w" },
            { id: 16, link: "https://www.youtube.com/embed/QXgQDM_B43k" },
            { id: 17, link: "https://www.youtube.com/embed/IBPlKHF29Zk" },
            { id: 18, link: "https://www.youtube.com/embed/6NWIatyC8q8" },
            { id: 19, link: "https://www.youtube.com/embed/nU1VfYYKMDk" },
            { id: 20, link: "https://www.youtube.com/embed/D_JxMb8RLEY" },
            { id: 21, link: "https://www.youtube.com/embed/2dX0FKRd2bg" },
            { id: 22, link: "https://www.youtube.com/embed/fLahce8rkEU" },
            { id: 23, link: "https://www.youtube.com/embed/iRqVIx9_iVQ" },
            { id: 24, link: "https://www.youtube.com/embed/rVE25pGBd9A" },
            { id: 25, link: "https://www.youtube.com/embed/NpYfKMma68A" },
            { id: 26, link: "https://www.youtube.com/embed/2TU7dE_9Vi4" },
            { id: 27, link: "https://www.youtube.com/embed/CrAOw5i9UwM" },
            { id: 28, link: "https://www.youtube.com/embed/dDHmJ4JsA4s" }
          ]
        },
        {
          tabId: 10,
          theme: {
            title: "Les chansons avec une couleur dans le titre",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/zA52uNzx7Y4" },
            { id: 2, link: "https://www.youtube.com/embed/UePtoxDhJSw" },
            { id: 3, link: "https://www.youtube.com/embed/zBft8qY6caE" },
            { id: 4, link: "https://www.youtube.com/embed/kqXSBe-qMGo" },
            { id: 5, link: "https://www.youtube.com/embed/O4irXQhgMqg" },
            { id: 6, link: "https://www.youtube.com/embed/SdryssUmlpE" },
            { id: 7, link: "https://www.youtube.com/embed/u3u22OYqFGo" },
            { id: 8, link: "https://www.youtube.com/embed/JRWox-i6aAk" },
            { id: 9, link: "https://www.youtube.com/embed/TvnYmWpD_T8" },
            { id: 10, link: "https://www.youtube.com/embed/TJAfLE39ZZ8" },
            { id: 11, link: "https://www.youtube.com/embed/dMrImMedYRo" },
            { id: 12, link: "https://www.youtube.com/embed/vq1ztJsbRek" },
            { id: 13, link: "https://www.youtube.com/embed/yKNxeF4KMsY" },
            { id: 14, link: "https://www.youtube.com/embed/zXt56MB-3vc" },
            { id: 15, link: "https://www.youtube.com/embed/lwlogyj7nFE" },
            { id: 16, link: "https://www.youtube.com/embed/Z0dsHPVHWW4" },
            { id: 17, link: "https://www.youtube.com/embed/NghU2kMcepQ" },
            { id: 18, link: "https://www.youtube.com/embed/dMYKNZSlze0" },
            { id: 19, link: "https://www.youtube.com/embed/J5bBCaUnPq4" },
            { id: 20, link: "https://www.youtube.com/embed/cTX4BAxMmvs" },
            { id: 21, link: "https://www.youtube.com/embed/cTX4BAxMmvs" },
            { id: 22, link: "https://www.youtube.com/embed/te9IWhXJvQo" },
            { id: 23, link: "https://www.youtube.com/embed/m2uTFF_3MaA" }
          ]
        },
        {
          tabId: 11,
          theme: {
            title: "Les meilleures chansons en langue étrangère",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/hcm55lU9knw" },
            { id: 2, link: "https://www.youtube.com/embed/2Z4m4lnjxkY" },
            { id: 3, link: "https://www.youtube.com/embed/dQ5XhJ-LXsc" },
            { id: 4, link: "https://www.youtube.com/embed/YnopHCL1Jk8" },
            { id: 5, link: "https://www.youtube.com/embed/TdWEhMOrRpQ" },
            { id: 6, link: "https://www.youtube.com/embed/_vjU-EqwMSo" },
            { id: 7, link: "https://www.youtube.com/embed/Ja-Ags-Yx84" },
            { id: 8, link: "https://www.youtube.com/embed/0fmHCpfAknE" },
            { id: 9, link: "https://www.youtube.com/embed/7AzimrAgWbA" },
            { id: 10, link: "https://www.youtube.com/embed/6miaTf1gF4g" },
            { id: 11, link: "https://www.youtube.com/embed/2qDou8eHXGQ" },
            { id: 12, link: "https://www.youtube.com/embed/QoPofJeWuR0" },
            { id: 13, link: "https://www.youtube.com/embed/989-7xsRLR4" },
            { id: 14, link: "https://www.youtube.com/embed/OwGG5fX7bxY" },
            { id: 15, link: "https://www.youtube.com/embed/m-jELpAdFyA" },
            { id: 16, link: "https://www.youtube.com/embed/HTgqZeTyU_k" },
            { id: 17, link: "https://www.youtube.com/embed/IEFzmuMUZwQ" },
            { id: 18, link: "https://www.youtube.com/embed/N0a2apeU-Hs" },
            { id: 19, link: "https://www.youtube.com/embed/OqoKizBhmyA" },
            { id: 20, link: "https://www.youtube.com/embed/X9fZJJdA3LM" },
            { id: 21, link: "https://www.youtube.com/embed/4Njp-J2s5uw" },
            { id: 22, link: "https://www.youtube.com/embed/d7BbSoRCIKs" },
            { id: 23, link: "https://www.youtube.com/embed/5x4MSTnaa1U" },
            { id: 24, link: "https://www.youtube.com/embed/7jpqqBX-Myw" },
            { id: 25, link: "https://www.youtube.com/embed/uWM4vBW6Ppo" },
            { id: 26, link: "https://www.youtube.com/embed/nnXm_Eo4KDk" },
            { id: 27, link: "https://www.youtube.com/embed/NeQM1c-XCDc" },
            { id: 28, link: "https://www.youtube.com/embed/BQe6hTKX35o" }
          ]
        },
        {
          tabId: 12,
          theme: {
            title: "Les meilleures chansons de l'hiver",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/pIBdAdnTqqo" },
            { id: 2, link: "https://www.youtube.com/embed/cHlf08yTPiU" },
            { id: 3, link: "https://www.youtube.com/embed/M-b3iU-INDo" },
            { id: 4, link: "https://www.youtube.com/embed/vqXETTRZD-U" },
            { id: 5, link: "https://www.youtube.com/embed/N-aK6JnyFmk" },
            { id: 6, link: "https://www.youtube.com/embed/e-Ho7IwupxI" },
            { id: 7, link: "https://www.youtube.com/embed/2Vv-BfVoq4g" },
            { id: 8, link: "https://www.youtube.com/embed/AdQ3JDLlmPI" },
            { id: 9, link: "https://www.youtube.com/embed/Z7BCGnEXN1c" },
            { id: 10, link: "https://www.youtube.com/embed/s3O1Xro7oAI" },
            { id: 11, link: "https://www.youtube.com/embed/CICIOJqEb5c" },
            { id: 12, link: "https://www.youtube.com/embed/QL3EZwSJAh0" },
            { id: 13, link: "https://www.youtube.com/embed/39NngdKksJw" },
            { id: 14, link: "https://www.youtube.com/embed/8BglEyv5O2Y" },
            { id: 15, link: "https://www.youtube.com/embed/Cwkej79U3ek" },
            { id: 16, link: "https://www.youtube.com/embed/Edaz7CUAZg8" },
            { id: 17, link: "https://www.youtube.com/embed/vEFGQN9qLkQ" },
            { id: 18, link: "https://www.youtube.com/embed/mtqZM8FLWuc" },
            { id: 19, link: "https://www.youtube.com/embed/QBPmp2BZvYM" },
            { id: 20, link: "https://www.youtube.com/embed/VWR41_H-zy4" },
            { id: 21, link: "https://www.youtube.com/embed/nJR7uVUuIjo" },
            { id: 22, link: "https://www.youtube.com/embed/AfeAhCWaMD0" },
            { id: 23, link: "https://www.youtube.com/embed/e89bcioQ3OQ" },
            { id: 24, link: "https://www.youtube.com/embed/yuFI5KSPAt4" }
          ]
        },
        {
          tabId: 13,
          theme: {
            title: "Les pépites que personne ne connait",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/RRf7H2cwRdw" },
            { id: 2, link: "https://www.youtube.com/embed/zgfcCTdZZsE" },
            { id: 3, link: "https://www.youtube.com/embed/qgsqvnMOj3E" },
            { id: 4, link: "https://www.youtube.com/embed/1j1cq22jQM4" },
            { id: 5, link: "https://www.youtube.com/embed/RNRRnvPVqlI" },
            { id: 6, link: "https://www.youtube.com/embed/ZoAATtUmvUs" },
            { id: 7, link: "https://www.youtube.com/embed/Rqljc9paCKM" },
            { id: 8, link: "https://www.youtube.com/embed/BMtNepVm-F0" },
            { id: 9, link: "https://www.youtube.com/embed/KLPGMb35ubk" },
            { id: 10, link: "https://www.youtube.com/embed/xHPDmfUncmg" },
            { id: 11, link: "https://www.youtube.com/embed/NX-cMOklGS8" },
            { id: 12, link: "https://www.youtube.com/embed/xJ4-vj4zBcw" },
            { id: 13, link: "https://www.youtube.com/embed/FHscs3Lx444" },
            { id: 14, link: "https://www.youtube.com/embed/s11BuatTuXk" },
            { id: 15, link: "https://www.youtube.com/embed/9_gidanrIFc" },
            { id: 16, link: "https://www.youtube.com/embed/GHI5BsOu1h0" }
          ]
        },
        {
          tabId: 14,
          theme: {
            title: "Les chansons de dessins animés",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/Hq37CiPD-sE" },
            { id: 2, link: "https://www.youtube.com/embed/w9u21s1wuok" },
            { id: 3, link: "https://www.youtube.com/embed/ah9RUyte3dQ" },
            { id: 4, link: "https://www.youtube.com/embed/xV00y9FM9Y8" },
            { id: 5, link: "https://www.youtube.com/embed/juQl2UbcD7w" },
            { id: 6, link: "https://www.youtube.com/embed/cNplZrRSjeI" },
            { id: 7, link: "https://www.youtube.com/embed/lKwXwk7jA9c" },
            { id: 8, link: "https://www.youtube.com/embed/kNnpHAszq64" },
            { id: 9, link: "https://www.youtube.com/embed/wQP9XZc2Y_c" },
            { id: 10, link: "https://www.youtube.com/embed/FkZCRvNb-Yo" },
            { id: 11, link: "https://www.youtube.com/embed/LKZQwvJ-bfU" },
            { id: 12, link: "https://www.youtube.com/embed/XHcvZZ65ZwA" },
            { id: 13, link: "https://www.youtube.com/embed/jVm1NbrXaXc" },
            { id: 14, link: "https://www.youtube.com/embed/BCnvlVazOfU" },
            { id: 15, link: "https://www.youtube.com/embed/c58zKvmtLJQ" },
            { id: 16, link: "https://www.youtube.com/embed/nsxFgyAzNu4" },
            { id: 17, link: "https://www.youtube.com/embed/EV_aHdpj23g" },
            { id: 18, link: "https://www.youtube.com/embed/o6wtDPVkKqI" },
            { id: 19, link: "https://www.youtube.com/embed/HNLxduS2Ld0" },
            { id: 20, link: "https://www.youtube.com/embed/DNR2AY7b6kI" },
            { id: 21, link: "https://www.youtube.com/embed/baFzdQiv6Gs" },
            { id: 22, link: "https://www.youtube.com/embed/AalixcgLptA" },
            { id: 23, link: "https://www.youtube.com/embed/X_PfzEIvuNY" }
          ]
        },
        {
          tabId: 15,
          theme: {
            title: "Les chansons d'amour",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/mhmGwTDpPf0" },
            { id: 2, link: "https://www.youtube.com/embed/2Vv-BfVoq4g" },
            { id: 3, link: "https://www.youtube.com/embed/TGgcC5xg9YI" },
            { id: 4, link: "https://www.youtube.com/embed/S9bCLPwzSC0" },
            { id: 5, link: "https://www.youtube.com/embed/bo_efYhYU2A" },
            { id: 6, link: "https://www.youtube.com/embed/rtIfld84Ydw" },
            { id: 7, link: "https://www.youtube.com/embed/i2wmKcBm4Ik" },
            { id: 8, link: "https://www.youtube.com/embed/FmnDXRJ7btE" },
            { id: 9, link: "https://www.youtube.com/embed/cTVpoT82toY" },
            { id: 10, link: "https://www.youtube.com/embed/_Ye8GLPUVsM" },
            { id: 11, link: "https://www.youtube.com/embed/39IU7ADaXmQ" },
            { id: 12, link: "https://www.youtube.com/embed/JErVP6xLZwg" },
            { id: 13, link: "https://www.youtube.com/embed/RBumgq5yVrA" },
            { id: 14, link: "https://www.youtube.com/embed/Mb1ZvUDvLDY" },
            { id: 15, link: "https://www.youtube.com/embed/rrltM8n1RJU" },
            { id: 16, link: "https://www.youtube.com/embed/Pe5q_TdKbsk" },
            { id: 17, link: "https://www.youtube.com/embed/LEremyjd0bk" },
            { id: 18, link: "https://www.youtube.com/embed/CV65tWCZALI" },
            { id: 19, link: "https://www.youtube.com/embed/-CaMP5M3Gso" },
            { id: 20, link: "https://www.youtube.com/embed/p92pXFgCKUg" },
            { id: 21, link: "https://www.youtube.com/embed/-0KvBnIvTFs" },
            { id: 22, link: "https://www.youtube.com/embed/3bCGacIl2f0" }
          ]
        },
        {
          tabId: 16,
          theme: {
            title: "Les chansons de votre adolescence",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/V3t8eVVgQJo" },
            { id: 2, link: "https://www.youtube.com/embed/eVTXPUF4Oz4" },
            { id: 3, link: "https://www.youtube.com/embed/ZLbmIQohjMc" },
            { id: 4, link: "https://www.youtube.com/embed/iAP9AF6DCu4" },
            { id: 5, link: "https://www.youtube.com/embed/Gd9OhYroLN0" },
            { id: 6, link: "https://www.youtube.com/embed/W3q8Od5qJio" },
            { id: 7, link: "https://www.youtube.com/embed/-JJAXwAaA2w" },
            { id: 8, link: "https://www.youtube.com/embed/bUfZVmcFrjI" },
            { id: 9, link: "https://www.youtube.com/embed/4-_B9Uo6Cy4" },
            { id: 10, link: "https://www.youtube.com/embed/WANpkVm3V2Y" },
            { id: 11, link: "https://www.youtube.com/embed/Dz4aeYPl-0Q" },
            { id: 12, link: "https://www.youtube.com/embed/E2KRH27aWcU" },
            { id: 13, link: "https://www.youtube.com/embed/zKFqbyDR6M4" },
            { id: 14, link: "https://www.youtube.com/embed/6Ejga4kJUts" },
            { id: 15, link: "https://www.youtube.com/embed/xlCmQcRPtRg" },
            { id: 16, link: "https://www.youtube.com/embed/TwhoaPgBwI8" },
            { id: 17, link: "https://www.youtube.com/embed/ub747pprmJ8" },
            { id: 18, link: "https://www.youtube.com/embed/ruAi4VBoBSM" },
            { id: 19, link: "https://www.youtube.com/embed/FrEP4MHCKDc" }
          ]
        },
        {
          tabId: 17,
          theme: {
            title: "Les chansons qu'on chante à tue tête",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/a2_ss9y-VjE" },
            { id: 2, link: "https://www.youtube.com/embed/uMQp0lnRZ94" },
            { id: 3, link: "https://www.youtube.com/embed/RDuzszjrdcc" },
            { id: 4, link: "https://www.youtube.com/embed/3fJYSQDiFY4" },
            { id: 5, link: "https://www.youtube.com/embed/xY84trzgyI8" },
            { id: 6, link: "https://www.youtube.com/embed/BW9Fzwuf43c" },
            { id: 7, link: "https://www.youtube.com/embed/WO9WnteQIIQ" },
            { id: 8, link: "https://www.youtube.com/embed/voQhp1K2TSk" },
            { id: 9, link: "https://www.youtube.com/embed/AzaTyxMduH4" },
            { id: 10, link: "https://www.youtube.com/embed/0J3wIDAaLSU" },
            { id: 11, link: "https://www.youtube.com/embed/ln0VwCqMkcA" },
            { id: 12, link: "https://www.youtube.com/embed/rOPoP4YWgmk" },
            { id: 13, link: "https://www.youtube.com/embed/ftBVC5hYATQ" },
            { id: 14, link: "https://www.youtube.com/embed/DHszVIYdESM" },
            { id: 15, link: "https://www.youtube.com/embed/PI9yKr39vGI" }
          ]
        },
        {
          tabId: 18,
          theme: {
            title: "Les meilleures chansons francophones",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/tVKWiseNGUU" },
            { id: 2, link: "https://www.youtube.com/embed/-eR6v2zcy4c" },
            { id: 3, link: "https://www.youtube.com/embed/INuD2D7R8bk" },
            { id: 4, link: "https://www.youtube.com/embed/PCKyauft1W4" },
            { id: 5, link: "https://www.youtube.com/embed/RHb5LKnnxLg" },
            { id: 6, link: "https://www.youtube.com/embed/7Q6S19Vvh6s" },
            { id: 7, link: "https://www.youtube.com/embed/dF0I-yxOzNA" },
            { id: 8, link: "https://www.youtube.com/embed/AOUdLzZaflw" },
            { id: 9, link: "https://www.youtube.com/embed/5GI4VOQZGrY" },
            { id: 10, link: "https://www.youtube.com/embed/jVe5dlpj-oY" },
            { id: 11, link: "https://www.youtube.com/embed/SD27eir2GNw" },
            { id: 12, link: "https://www.youtube.com/embed/T9TyPOHjIIU" },
            { id: 13, link: "https://www.youtube.com/embed/Hi7Rx3En7-k" },
            { id: 14, link: "https://www.youtube.com/embed/D136hOqYF28" },
            { id: 15, link: "https://www.youtube.com/embed/4slPJoy6o6E" },
            { id: 16, link: "https://www.youtube.com/embed/5JHaH1GzAO8" }
          ]
        },
        {
          tabId: 19,
          theme: {
            title: "Les chansons de Noël",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/uIU4DfmAH4Y" },
            { id: 2, link: "https://www.youtube.com/embed/B-NckB3CQ9o" },
            { id: 3, link: "https://www.youtube.com/embed/qVu7lsiMj8A" },
            { id: 4, link: "https://www.youtube.com/embed/Rt0spqQtMKg" },
            { id: 5, link: "https://www.youtube.com/embed/wQP9XZc2Y_c" },
            { id: 6, link: "https://www.youtube.com/embed/d7O08bjy4Ew" },
            { id: 7, link: "https://www.youtube.com/embed/L9O4WD7an8s" },
            { id: 8, link: "https://www.youtube.com/embed/yXQViqx6GMY" },
            { id: 9, link: "https://www.youtube.com/embed/L7R3DVB8h1g" },
            { id: 10, link: "https://www.youtube.com/embed/E8gmARGvPlI" },
            { id: 11, link: "https://www.youtube.com/embed/EXa0zHdD4mE" },
            { id: 12, link: "https://www.youtube.com/embed/i0HvkYD5Ec4" },
            { id: 13, link: "https://www.youtube.com/embed/n4oP0DhTpyQ" },
            { id: 14, link: "https://www.youtube.com/embed/n543eKIdbUI" },
            { id: 15, link: "https://www.youtube.com/embed/Z0ajuTaHBtM" },
            { id: 16, link: "https://www.youtube.com/embed/XZTzai1H9DM" },
            { id: 17, link: "https://www.youtube.com/embed/aLxazW8imUM" }
          ]
        },
        {
          tabId: 20,
          theme: {
            title: "Les chansons avec un prénom dans le titre",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/_naArkkHMMs" },
            { id: 2, link: "https://www.youtube.com/embed/sQ5idZHWVn4" },
            { id: 3, link: "https://www.youtube.com/embed/TZip_br_v3w" },
            { id: 4, link: "https://www.youtube.com/embed/3T1c7GkzRQQ" },
            { id: 5, link: "https://www.youtube.com/embed/gaprXsgI6kI" },
            { id: 6, link: "https://www.youtube.com/embed/Q06wFUi5OM8" },
            { id: 7, link: "https://www.youtube.com/embed/gReIHMN7IdY" },
            { id: 8, link: "https://www.youtube.com/embed/1V_xRb0x9aw" },
            { id: 9, link: "https://www.youtube.com/embed/uqsGUAM9WDk" },
            { id: 10, link: "https://www.youtube.com/embed/rvynnzt8VG4" },
            { id: 11, link: "https://www.youtube.com/embed/MKNMMRI57yU" },
            { id: 12, link: "https://www.youtube.com/embed/UB1RnDhWTfY" },
            { id: 13, link: "https://www.youtube.com/embed/eZWigBKC1i8" },
            { id: 14, link: "https://www.youtube.com/embed/0gpMlAiqcjU" },
            { id: 15, link: "https://www.youtube.com/embed/ar-zZ21iW9w" },
            { id: 16, link: "https://www.youtube.com/embed/hhuvQGoGNWw" },
            { id: 17, link: "https://www.youtube.com/embed/A2X5r6Oe-7M" },
            { id: 18, link: "https://www.youtube.com/embed/qV873dFNQFI" },
            { id: 19, link: "https://www.youtube.com/embed/AuAiU6j8d7k" },
            { id: 20, link: "https://www.youtube.com/embed/4BP__EF9ess" },
            { id: 21, link: "https://www.youtube.com/embed/oq0dRYGxIi0" },
            { id: 22, link: "https://www.youtube.com/embed/Oll7pr4JVTQ" },
            { id: 23, link: "https://www.youtube.com/embed/E68N5E1d0_M" },
            { id: 24, link: "https://www.youtube.com/embed/Sb5aq5HcS1A" }
          ]
        },
        {
          tabId: 21,
          theme: {
            title: "Les chansons les plus écoutées en 2020",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/wdbUJZlU5YE" },
            { id: 2, link: "https://www.youtube.com/embed/VQH8ZTgna3Q" },
            { id: 3, link: "https://www.youtube.com/embed/UEBIsUsvheA" },
            { id: 4, link: "https://www.youtube.com/embed/U3CeszWDts8" },
            { id: 5, link: "https://www.youtube.com/embed/w9u21s1wuok" },
            { id: 6, link: "https://www.youtube.com/embed/r63IWSeWCjw" },
            { id: 7, link: "https://www.youtube.com/embed/CkyRTriM4GY" },
            { id: 8, link: "https://www.youtube.com/embed/ZCat9nFdCK8" },
            { id: 9, link: "https://www.youtube.com/embed/W_MTc_ipm0k" },
            { id: 10, link: "https://www.youtube.com/embed/3Xl0Qr0uXuY" },
            { id: 11, link: "https://www.youtube.com/embed/JybV1mL6EMA" },
            { id: 12, link: "https://www.youtube.com/embed/SUJloylmEZM" },
            { id: 13, link: "https://www.youtube.com/embed/dqRZDebPIGs" },
            { id: 14, link: "https://www.youtube.com/embed/H4kPIl0_qK4" },
            { id: 15, link: "https://www.youtube.com/embed/5DxO_4Q-3bc" },
            { id: 16, link: "https://www.youtube.com/embed/grrrBeY31wk" },
            { id: 17, link: "https://www.youtube.com/embed/7lL1CW140FQ" },
            { id: 18, link: "https://www.youtube.com/embed/f2ZBgv4-xcI" },
            { id: 19, link: "https://www.youtube.com/embed/cOc2MzvqbN0" },
            { id: 20, link: "https://www.youtube.com/embed/0fAQhSRLQnM" },
            { id: 21, link: "https://www.youtube.com/embed/nPwGvjd2zOU" },
            { id: 22, link: "https://www.youtube.com/embed/of9adNYS9QM" }
          ]
        },
        {
          tabId: 22,
          theme: {
            title: "Les chansons qui rappellent les hobbies",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/gAg3uMlNyHA" },
            { id: 2, link: "https://www.youtube.com/embed/v7OLB7HmPVs" },
            { id: 3, link: "https://www.youtube.com/embed/Pn-VV8JMgiM" },
            { id: 4, link: "https://www.youtube.com/embed/wO0A0XcWy88" },
            { id: 5, link: "https://www.youtube.com/embed/LVRHiSIeuAI" },
            { id: 6, link: "https://www.youtube.com/embed/BAkqJT_sMKQ" },
            { id: 7, link: "https://www.youtube.com/embed/884a7M6q75o" },
            { id: 8, link: "https://www.youtube.com/embed/uH__4Ifc7U4" },
            { id: 9, link: "https://www.youtube.com/embed/d5P5Tz3VH94" },
            { id: 10, link: "https://www.youtube.com/embed/i1BDGqIfm8U" },
            { id: 11, link: "https://www.youtube.com/embed/FGLCESkr9cM" },
            { id: 12, link: "https://www.youtube.com/embed/IAXuu8tLVDM" },
            { id: 13, link: "https://www.youtube.com/embed/vCLEZM_N0K8" },
            { id: 14, link: "https://www.youtube.com/embed/A4YH2RLe81U" },
            { id: 15, link: "https://www.youtube.com/embed/Obim8BYGnOE" },
            { id: 16, link: "https://www.youtube.com/embed/QryoOF5jEbc" },
            { id: 17, link: "https://www.youtube.com/embed/tX4BvmB7pVQ" },
            { id: 18, link: "https://www.youtube.com/embed/kK42LZqO0wA" }
          ]
        },
        {
          tabId: 23,
          theme: {
            title: "Les chansons qui rendent triste",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/MjxA25Tj1Ks" },
            { id: 2, link: "https://www.youtube.com/embed/4N3N1MlvVc4" },
            { id: 3, link: "https://www.youtube.com/embed/Pg7y4czi3UQ" },
            { id: 4, link: "https://www.youtube.com/embed/o_Fl4XG0kBg" },
            { id: 5, link: "https://www.youtube.com/embed/MHkyCvR-iiI" },
            { id: 6, link: "https://www.youtube.com/embed/hLQl3WQQoQ0" },
            { id: 7, link: "https://www.youtube.com/embed/U3j9GaIdiho" },
            { id: 8, link: "https://www.youtube.com/embed/fCeTjwsCT7U" },
            { id: 9, link: "https://www.youtube.com/embed/dDY9rXMftWE" },
            { id: 10, link: "https://www.youtube.com/embed/yDO8pMOHQf4" },
            { id: 11, link: "https://www.youtube.com/embed/Bag1gUxuU0g" },
            { id: 12, link: "https://www.youtube.com/embed/MW1eQZ_PEb4" },
            { id: 13, link: "https://www.youtube.com/embed/Jtauh8GcxBY" },
            { id: 14, link: "https://www.youtube.com/embed/i2wmKcBm4Ik" },
            { id: 15, link: "https://www.youtube.com/embed/UQObMEXyhrU" },
            { id: 16, link: "https://www.youtube.com/embed/HANOtqR3nuY" },
            { id: 17, link: "https://www.youtube.com/embed/kyquqw6GeXk" },
            { id: 18, link: "https://www.youtube.com/embed/fbiOc9SjQS8" },
            { id: 19, link: "https://www.youtube.com/embed/rVC5QSlgXuU" },
            { id: 20, link: "https://www.youtube.com/embed/i2Yrit1Da1I" },
            { id: 21, link: "https://www.youtube.com/embed/2h7NQWf5ITg" }
          ]
        },
        {
          tabId: 24,
          theme: {
            title: "Les chansons qui parlent du temps",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/va1oiojnGrA" },
            { id: 2, link: "https://www.youtube.com/embed/OaQ5jZANSe8" },
            { id: 3, link: "https://www.youtube.com/embed/_GCxnoNq74U" },
            { id: 4, link: "https://www.youtube.com/embed/LpbHlXPmmcE" },
            { id: 5, link: "https://www.youtube.com/embed/F1mqrCTFoz4" },
            { id: 6, link: "https://www.youtube.com/embed/JaqLOsO6dTw" },
            { id: 7, link: "https://www.youtube.com/embed/EV0rJ6rvWbw" },
            { id: 8, link: "https://www.youtube.com/embed/NeQM1c-XCDc" },
            { id: 9, link: "https://www.youtube.com/embed/_YqzuE-5RE8" },
            { id: 10, link: "https://www.youtube.com/embed/l5aZJBLAu1E" },
            { id: 11, link: "https://www.youtube.com/embed/Y1NMZ749uJ0" },
            { id: 12, link: "https://www.youtube.com/embed/YltjliK0ZeA" },
            { id: 13, link: "https://www.youtube.com/embed/8kMEGdw_VF8" },
            { id: 14, link: "https://www.youtube.com/embed/eSqUIEgJtvk" },
            { id: 15, link: "https://www.youtube.com/embed/QYCOXG3nhDI" },
            { id: 16, link: "https://www.youtube.com/embed/LcJxrtURopg" },
            { id: 17, link: "https://www.youtube.com/embed/umj0gu5nEGs" },
            { id: 18, link: "https://www.youtube.com/embed/xLN5kx1EOEk" },
            { id: 19, link: "https://www.youtube.com/embed/lAwYodrBr2Q" },
            { id: 20, link: "https://www.youtube.com/embed/SZTPbtYhl5E" },
            { id: 21, link: "https://www.youtube.com/embed/wXTJBr9tt8Q" },
            { id: 22, link: "https://www.youtube.com/embed/G8SmkwS82u4" },
            { id: 23, link: "https://www.youtube.com/embed/B9dSYgd5Elk" },
            { id: 24, link: "https://www.youtube.com/embed/vWD7k6TrJ-g" }
          ]
        },
        {
          tabId: 25,
          theme: {
            title: "Les chansons avec des paroles incomprises",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/UceaB4D0jpo" },
            { id: 2, link: "https://www.youtube.com/embed/W-gmIG41dGA" },
            { id: 3, link: "https://www.youtube.com/embed/iPGgnzc34tY" },
            { id: 4, link: "https://www.youtube.com/embed/9bZkp7q19f0" },
            { id: 5, link: "https://www.youtube.com/embed/NXt2FLMJ_tI" },
            { id: 6, link: "https://www.youtube.com/embed/EpCphUPNPy4" },
            { id: 7, link: "https://www.youtube.com/embed/Hy8kmNEo1i8" },
            { id: 8, link: "https://www.youtube.com/embed/e4ZUspBCFWc" },
            { id: 9, link: "https://www.youtube.com/embed/35PocLHx534" },
            { id: 10, link: "https://www.youtube.com/embed/LpE1bJp8-4w" },
            { id: 11, link: "https://www.youtube.com/embed/V0PisGe66mY" },
            { id: 12, link: "https://www.youtube.com/embed/uWM4vBW6Ppo" },
            { id: 13, link: "https://www.youtube.com/embed/n6pJ4PriGzQ" },
            { id: 14, link: "https://www.youtube.com/embed/BtyHYIpykN0" },
            { id: 14, link: "https://www.youtube.com/embed/0MYN8mAEKUo" }
          ]
        },
        {
          tabId: 26,
          theme: {
            title: "Les chansons en duo",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/817P8W8-mGE" },
            { id: 2, link: "https://www.youtube.com/embed/Z68u6dJqoI0" },
            { id: 3, link: "https://www.youtube.com/embed/FM7MFYoylVs" },
            { id: 4, link: "https://www.youtube.com/embed/O5bJJviAX0c" },
            { id: 5, link: "https://www.youtube.com/embed/37StRy0LEbI" },
            { id: 6, link: "https://www.youtube.com/embed/vs61OHs2g-w" },
            { id: 7, link: "https://www.youtube.com/embed/7ss-xmvLGFw" },
            { id: 8, link: "https://www.youtube.com/embed/kJQP7kiw5Fk" },
            { id: 9, link: "https://www.youtube.com/embed/q0SyUgw98tE" },
            { id: 10, link: "https://www.youtube.com/embed/0J3vgcE5i2o" },
            { id: 11, link: "https://www.youtube.com/embed/0qeV8PDBH8E" },
            { id: 12, link: "https://www.youtube.com/embed/JkRKT6T0QLg" },
            { id: 13, link: "https://www.youtube.com/embed/ZwJ7AnQTiYM" },
            { id: 14, link: "https://www.youtube.com/embed/xAZbf5dr8V0" },
            { id: 15, link: "https://www.youtube.com/embed/shf-IuIxWYE" },
            { id: 16, link: "https://www.youtube.com/embed/xKWWyO-C2o0" },
            { id: 17, link: "https://www.youtube.com/embed/9JxIw58lkHQ" },
            { id: 18, link: "https://www.youtube.com/embed/VCXOuoVkhUY" }
          ]
        },
        {
          tabId: 27,
          theme: {
            title: "Les chansons d'artistes défunts",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/fregObNcHC8" },
            { id: 2, link: "https://www.youtube.com/embed/NxDO8PipeBw" },
            { id: 3, link: "https://www.youtube.com/embed/CHekNnySAfM" },
            { id: 4, link: "https://www.youtube.com/embed/KJ19PJ7-SWc" },
            { id: 5, link: "https://www.youtube.com/embed/I0Jx4IxEElw" },
            { id: 6, link: "https://www.youtube.com/embed/BmtvqNhWrT8" },
            { id: 7, link: "https://www.youtube.com/embed/VKtGRC3IAc0" },
            { id: 8, link: "https://www.youtube.com/embed/qORYO0atB6g" },
            { id: 9, link: "https://www.youtube.com/embed/y8AWFf7EAc4" },
            { id: 10, link: "https://www.youtube.com/embed/Zi_XLOBDo_Y" },
            { id: 11, link: "https://www.youtube.com/embed/sBspSJWRT2E" },
            { id: 12, link: "https://www.youtube.com/embed/aRcAvsZgjXA" },
            { id: 13, link: "https://www.youtube.com/embed/8AHCfZTRGiI" },
            { id: 14, link: "https://www.youtube.com/embed/9EKi2E9dVY8" },
            { id: 15, link: "https://www.youtube.com/embed/AZKcl4-tcuo" }
          ]
        },
        {
          tabId: 28,
          theme: {
            title: "Les chansons entendues en live",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/7hZFkWvUnuc" },
            { id: 2, link: "https://www.youtube.com/embed/gEPmA3USJdI" },
            { id: 3, link: "https://www.youtube.com/embed/Gt15F4QYToI" },
            { id: 4, link: "https://www.youtube.com/embed/WXv31OmnKqQ" },
            { id: 5, link: "https://www.youtube.com/embed/9AdfeHKyf54" },
            { id: 6, link: "https://www.youtube.com/embed/NiQjLxbQZOM" },
            { id: 7, link: "https://www.youtube.com/embed/5Gdy58y4hXA" },
            { id: 8, link: "https://www.youtube.com/embed/VKl9XJu0Syc" },
            { id: 9, link: "https://www.youtube.com/embed/2jKa_0xnTfU" },
            { id: 10, link: "https://www.youtube.com/embed/5p8kemVZxTs" },
            { id: 11, link: "https://www.youtube.com/embed/3Hj-ghDSJb8" },
            { id: 12, link: "https://www.youtube.com/embed/t6dhgD1UKcY" },
            { id: 13, link: "https://www.youtube.com/embed/lVKbF8khsrI" },
            { id: 14, link: "https://www.youtube.com/embed/rVopeu8_FKQ" }
          ]
        },
        {
          tabId: 29,
          theme: {
            title: "Les chansons sur les 4 éléments",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/2fngvQS_PmQ" },
            { id: 2, link: "https://www.youtube.com/embed/ikGyZh0VbPQ" },
            { id: 3, link: "https://www.youtube.com/embed/XAi3VTSdTxU" },
            { id: 4, link: "https://www.youtube.com/embed/IcseamG7ReY" },
            { id: 5, link: "https://www.youtube.com/embed/a2_ss9y-VjE" },
            { id: 6, link: "https://www.youtube.com/embed/s3O1Xro7oAI" },
            { id: 7, link: "https://www.youtube.com/embed/Ue4ZBbC8FJ8" },
            { id: 8, link: "https://www.youtube.com/embed/Sk-U8ruIQyA" },
            { id: 9, link: "https://www.youtube.com/embed/3OhqqT49VS0" },
            { id: 10, link: "https://www.youtube.com/embed/BGpzGu9Yp6Y" },
            { id: 11, link: "https://www.youtube.com/embed/mbj1RFaoyLk" },
            { id: 12, link: "https://www.youtube.com/embed/3_al-rdXySQ" },
            { id: 13, link: "https://www.youtube.com/embed/jEgNndDtQqY" }
          ]
        },
        {
          tabId: 30,
          theme: {
            title: "Les chansons découvertent grâce au challenge",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            { id: 1, link: "https://www.youtube.com/embed/NpYfKMma68A" },
            { id: 2, link: "https://www.youtube.com/embed/l_S_gTnUzvg" },
            { id: 3, link: "https://www.youtube.com/embed/t6dhgD1UKcY" },
            { id: 4, link: "https://www.youtube.com/embed/CkyRTriM4GY" },
            { id: 5, link: "https://www.youtube.com/embed/HTgqZeTyU_k" },
            { id: 6, link: "https://www.youtube.com/embed/uMQp0lnRZ94" },
            { id: 7, link: "https://www.youtube.com/embed/dk6MHwAFBuE" },
            { id: 8, link: "https://www.youtube.com/embed/1YRW1QRKTBc" },
            { id: 9, link: "https://www.youtube.com/embed/GHI5BsOu1h0" }
          ]
        }
      ]
    };
  },
  mounted() {
    setTimeout(() => {
      this.isLoading = false;
    }, 4000 /*0*/);
  },
  methods: {
    scrollTo(element) {
      document.querySelector(element).scrollIntoView({
        behavior: "smooth"
      });
    }
  }
};
</script>

<style>
.v-app::selection {
  background-color: #121212 !important;
  color: white !important;
}
.v-app-bar,
.v-footer {
  background: linear-gradient(to right, #ff0f7b, #f89b29);
}
.v-tabs .v-icon {
  color: white !important;
}
.v-tab {
  color: white !important;
  font-size: 1.7rem !important;
  font-family: "Quicksand", sans-serif;
}
.v-tab--active {
  color: white !important;
  filter: opacity(40%);
}
.v-main {
  background-color: #121212;
}
.v-window {
  background-color: transparent !important;
}
#dayTheme {
  width: 100vw;
  height: 100vh;
}
#dayTheme #title {
  height: 45%;
  line-height: 720px;
  text-align: center;
  color: white !important;
  font-size: 3.5vw !important;
  font-family: "Roboto", sans-serif;
  font-weight: 100;
}
#dayTheme #title a {
  color: white;
  text-decoration: none;
  position: relative;
}
#dayTheme #title a:after {
  background: none repeat scroll 0 0 transparent;
  bottom: 0;
  content: "";
  display: block;
  height: 2px;
  left: 50%;
  position: absolute;
  background: linear-gradient(to right, #ff0f7b, #f89b29);
  transition: width 0.3s ease 0s, left 0.3s ease 0s;
  width: 0;
}
#dayTheme #title a:hover:after {
  width: 100%;
  left: 0;
}
.scroll {
  width: 100%;
  height: 80px;
  line-height: 80px;
  text-align: center;
  color: white;
}
.scroll-btn {
  background: linear-gradient(to right, #ff0f7b, #f89b29) !important;
}
</style>
