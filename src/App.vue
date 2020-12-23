<template>
  <v-app>
    <LoadingScreen v-if="isLoading"></LoadingScreen>
    <v-app-bar v-else app flat fixed>
      <v-tabs id="tabs" v-model="tab" center-active show-arrows hide-slider>
        <v-tab v-for="day in days" :key="day.tabId">
          {{ day.tabId }}
        </v-tab>
      </v-tabs>
    </v-app-bar>

    <v-main>
      <v-tabs-items v-model="tab">
        <v-tab-item v-for="day in days" :key="day.tabId">
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
        {{ new Date().getFullYear() }} — Simon Guillochon
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
            title: "Les chansons qui rappellent l'été",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            "https://www.youtube.com/embed/JDglMK9sgIQ",
            "https://www.youtube.com/embed/YqeW9_5kURI",
            "https://www.youtube.com/embed/nkoKGu8JzKE",
            "https://www.youtube.com/embed/5NV6Rdv1a3I",
            "https://www.youtube.com/embed/apBWI6xrbLY",
            "https://www.youtube.com/embed/_om0W6xzQd8",
            "https://www.youtube.com/embed/1YRW1QRKTBc",
            "https://www.youtube.com/embed/7yCaNt9qRek",
            "https://www.youtube.com/embed/pK060iUFWXg",
            "https://www.youtube.com/embed/pRpeEdMmmQ0",
            "https://www.youtube.com/embed/KOOhPfMbuIQ",
            "https://www.youtube.com/embed/voQhp1K2TSk",
            "https://www.youtube.com/embed/YKbuj_2IU44",
            "https://www.youtube.com/embed/Kep479rwwJo",
            "https://www.youtube.com/embed/AOOyuDLnA7I",
            "https://www.youtube.com/embed/zUptsdVZ9EA",
            "https://www.youtube.com/embed/-CVn3-3g_BI",
            "https://www.youtube.com/embed/P6Mkertj4Hc",
            "https://www.youtube.com/embed/iD2xL3qqV7o",
            "https://www.youtube.com/embed/8CKuWPRq2Ps",
            "https://www.youtube.com/embed/3bCpUWeXjag",
            "https://www.youtube.com/embed/9YicQtP-xyg",
            "https://www.youtube.com/embed/SPlQpGeTbIE",
            "https://www.youtube.com/embed/tX66IUZuQnY",
            "https://www.youtube.com/embed/rUFgacK8sZ0"
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
            "https://www.youtube.com/embed/ahsFa6AYRaQ",
            "https://www.youtube.com/embed/fLexgOxsZu0",
            "https://www.youtube.com/embed/FZK9Zi26Izc",
            "https://www.youtube.com/embed/JsD6uEZsIsU",
            "https://www.youtube.com/embed/DG4JMKzpe8g",
            "https://www.youtube.com/embed/UPnMFUsKm8w",
            "https://www.youtube.com/embed/jZHLXzGwo5w",
            "https://www.youtube.com/embed/5wH3noQ3Jso",
            "https://www.youtube.com/embed/IZiC0ms8gDs",
            "https://www.youtube.com/embed/I32EQJlRq_0",
            "https://www.youtube.com/embed/COz9lDCFHjw",
            "https://www.youtube.com/embed/1LXsm9y-z3I",
            "https://www.youtube.com/embed/NIBKwPA04tM",
            "https://www.youtube.com/embed/8zz5o3TLzlM",
            "https://www.youtube.com/embed/OKMyqcTXxrM",
            "https://www.youtube.com/embed/Zz-DJr1Qs54",
            "https://www.youtube.com/embed/EHpmh5ZhzYE",
            "https://www.youtube.com/embed/KOIJ9P9mUF0",
            "https://www.youtube.com/embed/LanCLS_hIo4",
            "https://www.youtube.com/embed/50VNCymT-Cs",
            "https://www.youtube.com/embed/9xc91V8ZmBA",
            "https://www.youtube.com/embed/tI1uTVaCGDE",
            "https://www.youtube.com/embed/1hrgT_ZDUvs",
            "https://www.youtube.com/embed/VCXOuoVkhUY",
            "https://www.youtube.com/embed/eMKqjO1jyGU",
            "https://www.youtube.com/embed/5hNT2wtVIBI",
            "https://www.youtube.com/embed/xn_1hFdE-5g"
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
            "https://www.youtube.com/embed/kOYcbod5J0w",
            "https://www.youtube.com/embed/DeumyOzKqgI",
            "https://www.youtube.com/embed/nOE24dd0Xmc",
            "https://www.youtube.com/embed/PhJnpbicLnk",
            "https://www.youtube.com/embed/I-YYZiJvwpc",
            "https://www.youtube.com/embed/joxyFDmh_LY",
            "https://www.youtube.com/embed/KGD2N5hJ2e0",
            "https://www.youtube.com/embed/F1oHBcTdKL4",
            "https://www.youtube.com/embed/calah3bUM7g",
            "https://www.youtube.com/embed/NB4SuVwCgJ8",
            "https://www.youtube.com/embed/SjkJFKe4-iQ",
            "https://www.youtube.com/embed/9AN04imFDK8",
            "https://www.youtube.com/embed/L_jWHffIx5E",
            "https://www.youtube.com/embed/pFS4zYWxzNA",
            "https://www.youtube.com/embed/-yOZEiHLuVU",
            "https://www.youtube.com/embed/Hl5F9AFXQ-M",
            "https://www.youtube.com/embed/TgokkAeg8mg",
            "https://www.youtube.com/embed/94-PAIMDhaQ",
            "https://www.youtube.com/embed/_Yhyp-_hX2s",
            "https://www.youtube.com/embed/IujUFrlme9Q",
            "https://www.youtube.com/embed/ZxJrdCIejus",
            "https://www.youtube.com/embed/8CdcCD5V-d8",
            "https://www.youtube.com/embed/ZFL0REtkocY",
            "https://www.youtube.com/embed/p4zluA60hjs",
            "https://www.youtube.com/embed/D8zlUUrFK-M",
            "https://www.youtube.com/embed/BEm0AjTbsac",
            "https://www.youtube.com/embed/CaM__ljqHyo",
            "https://www.youtube.com/embed/qrrz54UtkCc"
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
            "https://www.youtube.com/embed/v9BtXaiLVA0",
            "https://www.youtube.com/embed/IeDMnyQzS88",
            "https://www.youtube.com/embed/twqM56f_cVo",
            "https://www.youtube.com/embed/uZmJ-4nRrIs",
            "https://www.youtube.com/embed/0Fy7opKu46c",
            "https://www.youtube.com/embed/ZuI61cTNbAk",
            "https://www.youtube.com/embed/82NUfPBHxYs",
            "https://www.youtube.com/embed/CSD2J8yaMmM",
            "https://www.youtube.com/embed/LviBwdfLn2Q",
            "https://www.youtube.com/embed/BR6pYICqZT0",
            "https://www.youtube.com/embed/xMfz1jlyQrw",
            "https://www.youtube.com/embed/Uq0aeEYLkIE",
            "https://www.youtube.com/embed/i19d1QnstsA",
            "https://www.youtube.com/embed/IcLnFAEia9c",
            "https://www.youtube.com/embed/wqCpjFMvz-k",
            "https://www.youtube.com/embed/dX3k_QDnzHE",
            "https://www.youtube.com/embed/tKi9Z-f6qX4",
            "https://www.youtube.com/embed/-sixBbRDw6w",
            "https://www.youtube.com/embed/PBwAxmrE194"
          ]
        },
        {
          tabId: 5,
          theme: {
            title: "Les chansons de la honte",
            link:
              "https://www.youtube.com/watch?v=87gWaABqGYs&list=PLQGYwOtPkncZASa8qRkg1npM0qf_0HUJe"
          },
          content: [
            "https://www.youtube.com/embed/87gWaABqGYs",
            "https://www.youtube.com/embed/x-VYdBKwSLc",
            "https://www.youtube.com/embed/8_YCbPbV-CM",
            "https://www.youtube.com/embed/QcvGo19imWg",
            "https://www.youtube.com/embed/elueA2rofoo",
            "https://www.youtube.com/embed/n3XJRk8Cyag",
            "https://www.youtube.com/embed/agrXgrAgQ0U",
            "https://www.youtube.com/embed/YFKV13x3Ae4",
            "https://www.youtube.com/embed/9GMAbl1Rz1k",
            "https://www.youtube.com/embed/4bPGxLxogvw",
            "https://www.youtube.com/embed/SRBFun4Vv8M",
            "https://www.youtube.com/embed/EkGiGf8utCM",
            "https://www.youtube.com/embed/xzZO5MazGGM",
            "https://www.youtube.com/embed/6wAx0aDfxZQ",
            "https://www.youtube.com/embed/XmjOdFZw8uc",
            "https://www.youtube.com/embed/GuyvZp_cM0c",
            "https://www.youtube.com/embed/QtOtMHQHcac",
            "https://www.youtube.com/embed/vC8qJfVYxZY",
            "https://www.youtube.com/embed/f4Mc-NYPHaQ",
            "https://www.youtube.com/embed/TX_ZmBCldnQ",
            "https://www.youtube.com/embed/vN81YuaLP6k",
            "https://www.youtube.com/embed/tOzOD-82mW0",
            "https://www.youtube.com/embed/wVSxShb8gZQ",
            "https://www.youtube.com/embed/DmeUuoxyt_E",
            "https://www.youtube.com/embed/rGe0PdW2ozw"
          ]
        },
        {
          tabId: 6,
          theme: {
            title: "Les chansons de la motivation",
            link:
              "https://www.youtube.com/watch?v=Y8KeT6dlB2c&list=PLQGYwOtPkncbp8xdMHwh7R3dKLV1mq152"
          },
          content: [
            "https://www.youtube.com/embed/Y8KeT6dlB2c",
            "https://www.youtube.com/embed/_raonMRuT54",
            "https://www.youtube.com/embed/JpxLaTsylBU",
            "https://www.youtube.com/embed/27d138zhyZQ",
            "https://www.youtube.com/embed/bAPqxiQpJpA",
            "https://www.youtube.com/embed/d5dIubsID_M",
            "https://www.youtube.com/embed/9mYtLuuBzQI",
            "https://www.youtube.com/embed/h0chqsOCQDI",
            "https://www.youtube.com/embed/ruuG2v88zSM",
            "https://www.youtube.com/embed/jpqV3dzYOgk",
            "https://www.youtube.com/embed/btPJPFnesV4",
            "https://www.youtube.com/embed/fGx6K90TmCI",
            "https://www.youtube.com/embed/KQ6zr6kCPj8",
            "https://www.youtube.com/embed/MwPb7g_BlXQ",
            "https://www.youtube.com/embed/W9DZuY_OPF8",
            "https://www.youtube.com/embed/myaN5jTh79o",
            "https://www.youtube.com/embed/4jIXcSxBP7U",
            "https://www.youtube.com/embed/xjBTNbEXbAA",
            "https://www.youtube.com/embed/4NQLmUOgT5M",
            "https://www.youtube.com/embed/40JmEj0_aVM",
            "https://www.youtube.com/embed/GGXzlRoNtHU",
            "https://www.youtube.com/embed/v2AC41dglnM"
          ]
        },
        {
          tabId: 7,
          theme: {
            title: "Les chansons pour danser toute la nuit",
            link:
              "https://www.youtube.com/watch?v=4G6QDNC4jPs&list=PLQGYwOtPkncZ2SJbyX1YLfzCnvCnV6sCG"
          },
          content: [
            "https://www.youtube.com/embed/4G6QDNC4jPs",
            "https://www.youtube.com/embed/l_S_gTnUzvg",
            "https://www.youtube.com/embed/kJQP7kiw5Fk",
            "https://www.youtube.com/embed/OC2R5fvJsxo",
            "https://www.youtube.com/embed/5OAysfkcMjg",
            "https://www.youtube.com/embed/iaGjz4dtr3o",
            "https://www.youtube.com/embed/XHGkGE6b850",
            "https://www.youtube.com/embed/9VQdVA2hjsA",
            "https://www.youtube.com/embed/u9LH_y159sg",
            "https://www.youtube.com/embed/bpEmjxobvbY",
            "https://www.youtube.com/embed/uSD4vsh1zDA",
            "https://www.youtube.com/embed/IhkuARmR8fs",
            "https://www.youtube.com/embed/Lgs9QUtWc3M",
            "https://www.youtube.com/embed/QtxlCsVKkvY",
            "https://www.youtube.com/embed/BPdrGOFXzGA",
            "https://www.youtube.com/embed/2OluGY9oPVA",
            "https://www.youtube.com/embed/FLAUI6pSFSs",
            "https://www.youtube.com/embed/5L6xyaeiV58",
            "https://www.youtube.com/embed/wZv62ShoStY",
            "https://www.youtube.com/embed/OP1Q1flNbVA",
            "https://www.youtube.com/embed/QlPS16NeBO0",
            "https://www.youtube.com/embed/tuK6n2Lkza0",
            "https://www.youtube.com/embed/6Z66wVo7uNw"
          ]
        },
        {
          tabId: 8,
          theme: {
            title: "Les chansons de l'année de naissance",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            "https://www.youtube.com/embed/dwDns8x3Jb4",
            "https://www.youtube.com/embed/pw15SBOrOz8",
            "https://www.youtube.com/embed/lcOxhH8N3Bo",
            "https://www.youtube.com/embed/NKeU1twQYX4",
            "https://www.youtube.com/embed/m3dQeNurXss",
            "https://www.youtube.com/embed/ihyQf8mww3o",
            "https://www.youtube.com/embed/KnFCNQUTgaU",
            "https://www.youtube.com/embed/wmin5WkOuPw",
            "https://www.youtube.com/embed/ijxk-fgcg7c",
            "https://www.youtube.com/embed/sFvENQBc-F8",
            "https://www.youtube.com/embed/ZyhrYis509A",
            "https://www.youtube.com/embed/NKMtZm2YuBE",
            "https://www.youtube.com/embed/DwrHwZyFN7M",
            "https://www.youtube.com/embed/7374CZQoS2Y",
            "https://www.youtube.com/embed/79fzeNUqQbQ",
            "https://www.youtube.com/embed/_r0n9Dv6XnY",
            "https://www.youtube.com/embed/JAHA4Jh5jkw",
            "https://www.youtube.com/embed/L1N3WXZ_1LM",
            "https://www.youtube.com/embed/WUaeNidruxs",
            "https://www.youtube.com/embed/75MMjly5AjM",
            "https://www.youtube.com/embed/I_2D8Eo15wE",
            "https://www.youtube.com/embed/OMOGaugKpzs",
            "https://www.youtube.com/embed/BtV1-gJ_bm0",
            "https://www.youtube.com/embed/rMxeXTnrRV0",
            "https://www.youtube.com/embed/8SbUC-UaAxE",
            "https://www.youtube.com/embed/hkHF0xvQOok",
            "https://www.youtube.com/embed/gJLIiF15wjQ",
            "https://www.youtube.com/embed/4TYv2PhG89A",
            "https://www.youtube.com/embed/Fcd3XuQwDQQ",
            "https://www.youtube.com/embed/j5rGm3kdTuk"
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
            "https://www.youtube.com/embed/W41szpiE3cQ",
            "https://www.youtube.com/embed/8AHCfZTRGiI",
            "https://www.youtube.com/embed/8K0EAc3abq8",
            "https://www.youtube.com/embed/HxJhYpTIrl8",
            "https://www.youtube.com/embed/y8AWFf7EAc4",
            "https://www.youtube.com/embed/IbVoo7YLWnI",
            "https://www.youtube.com/embed/Zx1_6F-nCaw",
            "https://www.youtube.com/embed/eDEoC3Xr-fY",
            "https://www.youtube.com/embed/m3lF2qEA2cw",
            "https://www.youtube.com/embed/Yifz3X_i-F8",
            "https://www.youtube.com/embed/qbMWw-kG9V4",
            "https://www.youtube.com/embed/u9Dg-g7t2l4",
            "https://www.youtube.com/embed/TB2Tp1IcoQQ",
            "https://www.youtube.com/embed/fregObNcHC8",
            "https://www.youtube.com/embed/o6rBK0BqL2w",
            "https://www.youtube.com/embed/QXgQDM_B43k",
            "https://www.youtube.com/embed/IBPlKHF29Zk",
            "https://www.youtube.com/embed/6NWIatyC8q8",
            "https://www.youtube.com/embed/nU1VfYYKMDk",
            "https://www.youtube.com/embed/D_JxMb8RLEY",
            "https://www.youtube.com/embed/2dX0FKRd2bg",
            "https://www.youtube.com/embed/fLahce8rkEU",
            "https://www.youtube.com/embed/iRqVIx9_iVQ",
            "https://www.youtube.com/embed/rVE25pGBd9A",
            "https://www.youtube.com/embed/NpYfKMma68A",
            "https://www.youtube.com/embed/2TU7dE_9Vi4",
            "https://www.youtube.com/embed/CrAOw5i9UwM",
            "https://www.youtube.com/embed/dDHmJ4JsA4s"
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
            "https://www.youtube.com/embed/zA52uNzx7Y4",
            "https://www.youtube.com/embed/UePtoxDhJSw",
            "https://www.youtube.com/embed/zBft8qY6caE",
            "https://www.youtube.com/embed/kqXSBe-qMGo",
            "https://www.youtube.com/embed/O4irXQhgMqg",
            "https://www.youtube.com/embed/SdryssUmlpE",
            "https://www.youtube.com/embed/u3u22OYqFGo",
            "https://www.youtube.com/embed/JRWox-i6aAk",
            "https://www.youtube.com/embed/TvnYmWpD_T8",
            "https://www.youtube.com/embed/TJAfLE39ZZ8",
            "https://www.youtube.com/embed/dMrImMedYRo",
            "https://www.youtube.com/embed/vq1ztJsbRek",
            "https://www.youtube.com/embed/yKNxeF4KMsY",
            "https://www.youtube.com/embed/zXt56MB-3vc",
            "https://www.youtube.com/embed/lwlogyj7nFE",
            "https://www.youtube.com/embed/Z0dsHPVHWW4",
            "https://www.youtube.com/embed/NghU2kMcepQ",
            "https://www.youtube.com/embed/dMYKNZSlze0",
            "https://www.youtube.com/embed/J5bBCaUnPq4",
            "https://www.youtube.com/embed/cTX4BAxMmvs",
            "https://www.youtube.com/embed/cTX4BAxMmvs",
            "https://www.youtube.com/embed/te9IWhXJvQo",
            "https://www.youtube.com/embed/m2uTFF_3MaA"
          ]
        },
        {
          tabId: 11,
          theme: {
            title: "Les chansons en langues étrangères",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            "https://www.youtube.com/embed/hcm55lU9knw",
            "https://www.youtube.com/embed/2Z4m4lnjxkY",
            "https://www.youtube.com/embed/dQ5XhJ-LXsc",
            "https://www.youtube.com/embed/YnopHCL1Jk8",
            "https://www.youtube.com/embed/TdWEhMOrRpQ",
            "https://www.youtube.com/embed/_vjU-EqwMSo",
            "https://www.youtube.com/embed/Ja-Ags-Yx84",
            "https://www.youtube.com/embed/0fmHCpfAknE",
            "https://www.youtube.com/embed/7AzimrAgWbA",
            "https://www.youtube.com/embed/6miaTf1gF4g",
            "https://www.youtube.com/embed/2qDou8eHXGQ",
            "https://www.youtube.com/embed/QoPofJeWuR0",
            "https://www.youtube.com/embed/989-7xsRLR4",
            "https://www.youtube.com/embed/OwGG5fX7bxY",
            "https://www.youtube.com/embed/m-jELpAdFyA",
            "https://www.youtube.com/embed/HTgqZeTyU_k",
            "https://www.youtube.com/embed/IEFzmuMUZwQ",
            "https://www.youtube.com/embed/N0a2apeU-Hs",
            "https://www.youtube.com/embed/OqoKizBhmyA",
            "https://www.youtube.com/embed/X9fZJJdA3LM",
            "https://www.youtube.com/embed/4Njp-J2s5uw",
            "https://www.youtube.com/embed/d7BbSoRCIKs",
            "https://www.youtube.com/embed/5x4MSTnaa1U",
            "https://www.youtube.com/embed/7jpqqBX-Myw",
            "https://www.youtube.com/embed/uWM4vBW6Ppo",
            "https://www.youtube.com/embed/nnXm_Eo4KDk",
            "https://www.youtube.com/embed/NeQM1c-XCDc",
            "https://www.youtube.com/embed/BQe6hTKX35o"
          ]
        },
        {
          tabId: 12,
          theme: {
            title: "Les chansons de l'hiver",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            "https://www.youtube.com/embed/pIBdAdnTqqo",
            "https://www.youtube.com/embed/cHlf08yTPiU",
            "https://www.youtube.com/embed/M-b3iU-INDo",
            "https://www.youtube.com/embed/vqXETTRZD-U",
            "https://www.youtube.com/embed/N-aK6JnyFmk",
            "https://www.youtube.com/embed/e-Ho7IwupxI",
            "https://www.youtube.com/embed/2Vv-BfVoq4g",
            "https://www.youtube.com/embed/AdQ3JDLlmPI",
            "https://www.youtube.com/embed/Z7BCGnEXN1c",
            "https://www.youtube.com/embed/s3O1Xro7oAI",
            "https://www.youtube.com/embed/CICIOJqEb5c",
            "https://www.youtube.com/embed/QL3EZwSJAh0",
            "https://www.youtube.com/embed/39NngdKksJw",
            "https://www.youtube.com/embed/8BglEyv5O2Y",
            "https://www.youtube.com/embed/Cwkej79U3ek",
            "https://www.youtube.com/embed/Edaz7CUAZg8",
            "https://www.youtube.com/embed/vEFGQN9qLkQ",
            "https://www.youtube.com/embed/mtqZM8FLWuc",
            "https://www.youtube.com/embed/QBPmp2BZvYM",
            "https://www.youtube.com/embed/VWR41_H-zy4",
            "https://www.youtube.com/embed/nJR7uVUuIjo",
            "https://www.youtube.com/embed/AfeAhCWaMD0",
            "https://www.youtube.com/embed/e89bcioQ3OQ",
            "https://www.youtube.com/embed/yuFI5KSPAt4"
          ]
        },
        {
          tabId: 13,
          theme: {
            title: "Les pépites que personne ne connaît",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            "https://www.youtube.com/embed/RRf7H2cwRdw",
            "https://www.youtube.com/embed/zgfcCTdZZsE",
            "https://www.youtube.com/embed/qgsqvnMOj3E",
            "https://www.youtube.com/embed/1j1cq22jQM4",
            "https://www.youtube.com/embed/RNRRnvPVqlI",
            "https://www.youtube.com/embed/ZoAATtUmvUs",
            "https://www.youtube.com/embed/Rqljc9paCKM",
            "https://www.youtube.com/embed/BMtNepVm-F0",
            "https://www.youtube.com/embed/KLPGMb35ubk",
            "https://www.youtube.com/embed/xHPDmfUncmg",
            "https://www.youtube.com/embed/NX-cMOklGS8",
            "https://www.youtube.com/embed/xJ4-vj4zBcw",
            "https://www.youtube.com/embed/FHscs3Lx444",
            "https://www.youtube.com/embed/s11BuatTuXk",
            "https://www.youtube.com/embed/9_gidanrIFc",
            "https://www.youtube.com/embed/GHI5BsOu1h0"
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
            "https://www.youtube.com/embed/Hq37CiPD-sE",
            "https://www.youtube.com/embed/w9u21s1wuok",
            "https://www.youtube.com/embed/ah9RUyte3dQ",
            "https://www.youtube.com/embed/xV00y9FM9Y8",
            "https://www.youtube.com/embed/juQl2UbcD7w",
            "https://www.youtube.com/embed/cNplZrRSjeI",
            "https://www.youtube.com/embed/lKwXwk7jA9c",
            "https://www.youtube.com/embed/kNnpHAszq64",
            "https://www.youtube.com/embed/wQP9XZc2Y_c",
            "https://www.youtube.com/embed/FkZCRvNb-Yo",
            "https://www.youtube.com/embed/LKZQwvJ-bfU",
            "https://www.youtube.com/embed/XHcvZZ65ZwA",
            "https://www.youtube.com/embed/jVm1NbrXaXc",
            "https://www.youtube.com/embed/BCnvlVazOfU",
            "https://www.youtube.com/embed/c58zKvmtLJQ",
            "https://www.youtube.com/embed/nsxFgyAzNu4",
            "https://www.youtube.com/embed/EV_aHdpj23g",
            "https://www.youtube.com/embed/o6wtDPVkKqI",
            "https://www.youtube.com/embed/HNLxduS2Ld0",
            "https://www.youtube.com/embed/DNR2AY7b6kI",
            "https://www.youtube.com/embed/baFzdQiv6Gs",
            "https://www.youtube.com/embed/AalixcgLptA",
            "https://www.youtube.com/embed/X_PfzEIvuNY"
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
            "https://www.youtube.com/embed/mhmGwTDpPf0",
            "https://www.youtube.com/embed/2Vv-BfVoq4g",
            "https://www.youtube.com/embed/TGgcC5xg9YI",
            "https://www.youtube.com/embed/S9bCLPwzSC0",
            "https://www.youtube.com/embed/bo_efYhYU2A",
            "https://www.youtube.com/embed/rtIfld84Ydw",
            "https://www.youtube.com/embed/i2wmKcBm4Ik",
            "https://www.youtube.com/embed/FmnDXRJ7btE",
            "https://www.youtube.com/embed/cTVpoT82toY",
            "https://www.youtube.com/embed/_Ye8GLPUVsM",
            "https://www.youtube.com/embed/39IU7ADaXmQ",
            "https://www.youtube.com/embed/JErVP6xLZwg",
            "https://www.youtube.com/embed/RBumgq5yVrA",
            "https://www.youtube.com/embed/Mb1ZvUDvLDY",
            "https://www.youtube.com/embed/rrltM8n1RJU",
            "https://www.youtube.com/embed/Pe5q_TdKbsk",
            "https://www.youtube.com/embed/LEremyjd0bk",
            "https://www.youtube.com/embed/CV65tWCZALI",
            "https://www.youtube.com/embed/-CaMP5M3Gso",
            "https://www.youtube.com/embed/p92pXFgCKUg",
            "https://www.youtube.com/embed/-0KvBnIvTFs",
            "https://www.youtube.com/embed/3bCGacIl2f0"
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
            "https://www.youtube.com/embed/V3t8eVVgQJo",
            "https://www.youtube.com/embed/eVTXPUF4Oz4",
            "https://www.youtube.com/embed/ZLbmIQohjMc",
            "https://www.youtube.com/embed/iAP9AF6DCu4",
            "https://www.youtube.com/embed/Gd9OhYroLN0",
            "https://www.youtube.com/embed/W3q8Od5qJio",
            "https://www.youtube.com/embed/-JJAXwAaA2w",
            "https://www.youtube.com/embed/bUfZVmcFrjI",
            "https://www.youtube.com/embed/4-_B9Uo6Cy4",
            "https://www.youtube.com/embed/WANpkVm3V2Y",
            "https://www.youtube.com/embed/Dz4aeYPl-0Q",
            "https://www.youtube.com/embed/E2KRH27aWcU",
            "https://www.youtube.com/embed/zKFqbyDR6M4",
            "https://www.youtube.com/embed/6Ejga4kJUts",
            "https://www.youtube.com/embed/xlCmQcRPtRg",
            "https://www.youtube.com/embed/TwhoaPgBwI8",
            "https://www.youtube.com/embed/ub747pprmJ8",
            "https://www.youtube.com/embed/ruAi4VBoBSM",
            "https://www.youtube.com/embed/FrEP4MHCKDc"
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
            "https://www.youtube.com/embed/a2_ss9y-VjE",
            "https://www.youtube.com/embed/uMQp0lnRZ94",
            "https://www.youtube.com/embed/RDuzszjrdcc",
            "https://www.youtube.com/embed/3fJYSQDiFY4",
            "https://www.youtube.com/embed/xY84trzgyI8",
            "https://www.youtube.com/embed/BW9Fzwuf43c",
            "https://www.youtube.com/embed/WO9WnteQIIQ",
            "https://www.youtube.com/embed/voQhp1K2TSk",
            "https://www.youtube.com/embed/AzaTyxMduH4",
            "https://www.youtube.com/embed/0J3wIDAaLSU",
            "https://www.youtube.com/embed/ln0VwCqMkcA",
            "https://www.youtube.com/embed/rOPoP4YWgmk",
            "https://www.youtube.com/embed/ftBVC5hYATQ",
            "https://www.youtube.com/embed/DHszVIYdESM",
            "https://www.youtube.com/embed/PI9yKr39vGI"
          ]
        },
        {
          tabId: 18,
          theme: {
            title: "Les chansons francophones",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            "https://www.youtube.com/embed/tVKWiseNGUU",
            "https://www.youtube.com/embed/-eR6v2zcy4c",
            "https://www.youtube.com/embed/INuD2D7R8bk",
            "https://www.youtube.com/embed/PCKyauft1W4",
            "https://www.youtube.com/embed/RHb5LKnnxLg",
            "https://www.youtube.com/embed/7Q6S19Vvh6s",
            "https://www.youtube.com/embed/dF0I-yxOzNA",
            "https://www.youtube.com/embed/AOUdLzZaflw",
            "https://www.youtube.com/embed/5GI4VOQZGrY",
            "https://www.youtube.com/embed/jVe5dlpj-oY",
            "https://www.youtube.com/embed/SD27eir2GNw",
            "https://www.youtube.com/embed/T9TyPOHjIIU",
            "https://www.youtube.com/embed/Hi7Rx3En7-k",
            "https://www.youtube.com/embed/D136hOqYF28",
            "https://www.youtube.com/embed/4slPJoy6o6E",
            "https://www.youtube.com/embed/5JHaH1GzAO8"
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
            "https://www.youtube.com/embed/uIU4DfmAH4Y",
            "https://www.youtube.com/embed/B-NckB3CQ9o",
            "https://www.youtube.com/embed/qVu7lsiMj8A",
            "https://www.youtube.com/embed/Rt0spqQtMKg",
            "https://www.youtube.com/embed/wQP9XZc2Y_c",
            "https://www.youtube.com/embed/d7O08bjy4Ew",
            "https://www.youtube.com/embed/L9O4WD7an8s",
            "https://www.youtube.com/embed/yXQViqx6GMY",
            "https://www.youtube.com/embed/L7R3DVB8h1g",
            "https://www.youtube.com/embed/E8gmARGvPlI",
            "https://www.youtube.com/embed/EXa0zHdD4mE",
            "https://www.youtube.com/embed/i0HvkYD5Ec4",
            "https://www.youtube.com/embed/n4oP0DhTpyQ",
            "https://www.youtube.com/embed/n543eKIdbUI",
            "https://www.youtube.com/embed/Z0ajuTaHBtM",
            "https://www.youtube.com/embed/XZTzai1H9DM",
            "https://www.youtube.com/embed/aLxazW8imUM"
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
            "https://www.youtube.com/embed/_naArkkHMMs",
            "https://www.youtube.com/embed/sQ5idZHWVn4",
            "https://www.youtube.com/embed/TZip_br_v3w",
            "https://www.youtube.com/embed/3T1c7GkzRQQ",
            "https://www.youtube.com/embed/gaprXsgI6kI",
            "https://www.youtube.com/embed/Q06wFUi5OM8",
            "https://www.youtube.com/embed/gReIHMN7IdY",
            "https://www.youtube.com/embed/1V_xRb0x9aw",
            "https://www.youtube.com/embed/uqsGUAM9WDk",
            "https://www.youtube.com/embed/rvynnzt8VG4",
            "https://www.youtube.com/embed/MKNMMRI57yU",
            "https://www.youtube.com/embed/UB1RnDhWTfY",
            "https://www.youtube.com/embed/eZWigBKC1i8",
            "https://www.youtube.com/embed/0gpMlAiqcjU",
            "https://www.youtube.com/embed/ar-zZ21iW9w",
            "https://www.youtube.com/embed/hhuvQGoGNWw",
            "https://www.youtube.com/embed/A2X5r6Oe-7M",
            "https://www.youtube.com/embed/qV873dFNQFI",
            "https://www.youtube.com/embed/AuAiU6j8d7k",
            "https://www.youtube.com/embed/4BP__EF9ess",
            "https://www.youtube.com/embed/oq0dRYGxIi0",
            "https://www.youtube.com/embed/Oll7pr4JVTQ",
            "https://www.youtube.com/embed/E68N5E1d0_M",
            "https://www.youtube.com/embed/Sb5aq5HcS1A"
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
            "https://www.youtube.com/embed/wdbUJZlU5YE",
            "https://www.youtube.com/embed/VQH8ZTgna3Q",
            "https://www.youtube.com/embed/UEBIsUsvheA",
            "https://www.youtube.com/embed/U3CeszWDts8",
            "https://www.youtube.com/embed/w9u21s1wuok",
            "https://www.youtube.com/embed/r63IWSeWCjw",
            "https://www.youtube.com/embed/CkyRTriM4GY",
            "https://www.youtube.com/embed/ZCat9nFdCK8",
            "https://www.youtube.com/embed/W_MTc_ipm0k",
            "https://www.youtube.com/embed/3Xl0Qr0uXuY",
            "https://www.youtube.com/embed/JybV1mL6EMA",
            "https://www.youtube.com/embed/SUJloylmEZM",
            "https://www.youtube.com/embed/dqRZDebPIGs",
            "https://www.youtube.com/embed/H4kPIl0_qK4",
            "https://www.youtube.com/embed/5DxO_4Q-3bc",
            "https://www.youtube.com/embed/grrrBeY31wk",
            "https://www.youtube.com/embed/7lL1CW140FQ",
            "https://www.youtube.com/embed/f2ZBgv4-xcI",
            "https://www.youtube.com/embed/cOc2MzvqbN0",
            "https://www.youtube.com/embed/0fAQhSRLQnM",
            "https://www.youtube.com/embed/nPwGvjd2zOU",
            "https://www.youtube.com/embed/of9adNYS9QM"
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
            "https://www.youtube.com/embed/gAg3uMlNyHA",
            "https://www.youtube.com/embed/v7OLB7HmPVs",
            "https://www.youtube.com/embed/Pn-VV8JMgiM",
            "https://www.youtube.com/embed/wO0A0XcWy88",
            "https://www.youtube.com/embed/LVRHiSIeuAI",
            "https://www.youtube.com/embed/BAkqJT_sMKQ",
            "https://www.youtube.com/embed/884a7M6q75o",
            "https://www.youtube.com/embed/uH__4Ifc7U4",
            "https://www.youtube.com/embed/d5P5Tz3VH94",
            "https://www.youtube.com/embed/i1BDGqIfm8U",
            "https://www.youtube.com/embed/FGLCESkr9cM",
            "https://www.youtube.com/embed/IAXuu8tLVDM",
            "https://www.youtube.com/embed/vCLEZM_N0K8",
            "https://www.youtube.com/embed/A4YH2RLe81U",
            "https://www.youtube.com/embed/Obim8BYGnOE",
            "https://www.youtube.com/embed/QryoOF5jEbc",
            "https://www.youtube.com/embed/tX4BvmB7pVQ",
            "https://www.youtube.com/embed/kK42LZqO0wA"
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
            "https://www.youtube.com/embed/MjxA25Tj1Ks",
            "https://www.youtube.com/embed/4N3N1MlvVc4",
            "https://www.youtube.com/embed/Pg7y4czi3UQ",
            "https://www.youtube.com/embed/o_Fl4XG0kBg",
            "https://www.youtube.com/embed/MHkyCvR-iiI",
            "https://www.youtube.com/embed/hLQl3WQQoQ0",
            "https://www.youtube.com/embed/U3j9GaIdiho",
            "https://www.youtube.com/embed/fCeTjwsCT7U",
            "https://www.youtube.com/embed/dDY9rXMftWE",
            "https://www.youtube.com/embed/yDO8pMOHQf4",
            "https://www.youtube.com/embed/Bag1gUxuU0g",
            "https://www.youtube.com/embed/MW1eQZ_PEb4",
            "https://www.youtube.com/embed/Jtauh8GcxBY",
            "https://www.youtube.com/embed/i2wmKcBm4Ik",
            "https://www.youtube.com/embed/UQObMEXyhrU",
            "https://www.youtube.com/embed/HANOtqR3nuY",
            "https://www.youtube.com/embed/kyquqw6GeXk",
            "https://www.youtube.com/embed/fbiOc9SjQS8",
            "https://www.youtube.com/embed/rVC5QSlgXuU",
            "https://www.youtube.com/embed/i2Yrit1Da1I",
            "https://www.youtube.com/embed/2h7NQWf5ITg"
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
            "https://www.youtube.com/embed/va1oiojnGrA",
            "https://www.youtube.com/embed/OaQ5jZANSe8",
            "https://www.youtube.com/embed/_GCxnoNq74U",
            "https://www.youtube.com/embed/LpbHlXPmmcE",
            "https://www.youtube.com/embed/F1mqrCTFoz4",
            "https://www.youtube.com/embed/JaqLOsO6dTw",
            "https://www.youtube.com/embed/EV0rJ6rvWbw",
            "https://www.youtube.com/embed/NeQM1c-XCDc",
            "https://www.youtube.com/embed/_YqzuE-5RE8",
            "https://www.youtube.com/embed/l5aZJBLAu1E",
            "https://www.youtube.com/embed/Y1NMZ749uJ0",
            "https://www.youtube.com/embed/YltjliK0ZeA",
            "https://www.youtube.com/embed/8kMEGdw_VF8",
            "https://www.youtube.com/embed/eSqUIEgJtvk",
            "https://www.youtube.com/embed/QYCOXG3nhDI",
            "https://www.youtube.com/embed/LcJxrtURopg",
            "https://www.youtube.com/embed/umj0gu5nEGs",
            "https://www.youtube.com/embed/xLN5kx1EOEk",
            "https://www.youtube.com/embed/lAwYodrBr2Q",
            "https://www.youtube.com/embed/SZTPbtYhl5E",
            "https://www.youtube.com/embed/wXTJBr9tt8Q",
            "https://www.youtube.com/embed/G8SmkwS82u4",
            "https://www.youtube.com/embed/B9dSYgd5Elk",
            "https://www.youtube.com/embed/vWD7k6TrJ-g"
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
            "https://www.youtube.com/embed/UceaB4D0jpo",
            "https://www.youtube.com/embed/W-gmIG41dGA",
            "https://www.youtube.com/embed/iPGgnzc34tY",
            "https://www.youtube.com/embed/9bZkp7q19f0",
            "https://www.youtube.com/embed/NXt2FLMJ_tI",
            "https://www.youtube.com/embed/EpCphUPNPy4",
            "https://www.youtube.com/embed/Hy8kmNEo1i8",
            "https://www.youtube.com/embed/e4ZUspBCFWc",
            "https://www.youtube.com/embed/35PocLHx534",
            "https://www.youtube.com/embed/LpE1bJp8-4w",
            "https://www.youtube.com/embed/V0PisGe66mY",
            "https://www.youtube.com/embed/uWM4vBW6Ppo",
            "https://www.youtube.com/embed/n6pJ4PriGzQ",
            "https://www.youtube.com/embed/BtyHYIpykN0",
            "https://www.youtube.com/embed/0MYN8mAEKUo"
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
            "https://www.youtube.com/embed/817P8W8-mGE",
            "https://www.youtube.com/embed/Z68u6dJqoI0",
            "https://www.youtube.com/embed/FM7MFYoylVs",
            "https://www.youtube.com/embed/O5bJJviAX0c",
            "https://www.youtube.com/embed/37StRy0LEbI",
            "https://www.youtube.com/embed/vs61OHs2g-w",
            "https://www.youtube.com/embed/7ss-xmvLGFw",
            "https://www.youtube.com/embed/kJQP7kiw5Fk",
            "https://www.youtube.com/embed/q0SyUgw98tE",
            "https://www.youtube.com/embed/0J3vgcE5i2o",
            "https://www.youtube.com/embed/0qeV8PDBH8E",
            "https://www.youtube.com/embed/JkRKT6T0QLg",
            "https://www.youtube.com/embed/ZwJ7AnQTiYM",
            "https://www.youtube.com/embed/xAZbf5dr8V0",
            "https://www.youtube.com/embed/shf-IuIxWYE",
            "https://www.youtube.com/embed/xKWWyO-C2o0",
            "https://www.youtube.com/embed/9JxIw58lkHQ",
            "https://www.youtube.com/embed/VCXOuoVkhUY"
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
            "https://www.youtube.com/embed/fregObNcHC8",
            "https://www.youtube.com/embed/NxDO8PipeBw",
            "https://www.youtube.com/embed/CHekNnySAfM",
            "https://www.youtube.com/embed/KJ19PJ7-SWc",
            "https://www.youtube.com/embed/I0Jx4IxEElw",
            "https://www.youtube.com/embed/BmtvqNhWrT8",
            "https://www.youtube.com/embed/VKtGRC3IAc0",
            "https://www.youtube.com/embed/qORYO0atB6g",
            "https://www.youtube.com/embed/y8AWFf7EAc4",
            "https://www.youtube.com/embed/Zi_XLOBDo_Y",
            "https://www.youtube.com/embed/sBspSJWRT2E",
            "https://www.youtube.com/embed/aRcAvsZgjXA",
            "https://www.youtube.com/embed/8AHCfZTRGiI",
            "https://www.youtube.com/embed/9EKi2E9dVY8",
            "https://www.youtube.com/embed/AZKcl4-tcuo"
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
            "https://www.youtube.com/embed/7hZFkWvUnuc",
            "https://www.youtube.com/embed/gEPmA3USJdI",
            "https://www.youtube.com/embed/Gt15F4QYToI",
            "https://www.youtube.com/embed/WXv31OmnKqQ",
            "https://www.youtube.com/embed/9AdfeHKyf54",
            "https://www.youtube.com/embed/NiQjLxbQZOM",
            "https://www.youtube.com/embed/5Gdy58y4hXA",
            "https://www.youtube.com/embed/VKl9XJu0Syc",
            "https://www.youtube.com/embed/2jKa_0xnTfU",
            "https://www.youtube.com/embed/5p8kemVZxTs",
            "https://www.youtube.com/embed/3Hj-ghDSJb8",
            "https://www.youtube.com/embed/t6dhgD1UKcY",
            "https://www.youtube.com/embed/lVKbF8khsrI",
            "https://www.youtube.com/embed/rVopeu8_FKQ"
          ]
        },
        {
          tabId: 29,
          theme: {
            title: "Les chansons sur les quatre éléments",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            "https://www.youtube.com/embed/2fngvQS_PmQ",
            "https://www.youtube.com/embed/ikGyZh0VbPQ",
            "https://www.youtube.com/embed/XAi3VTSdTxU",
            "https://www.youtube.com/embed/IcseamG7ReY",
            "https://www.youtube.com/embed/a2_ss9y-VjE",
            "https://www.youtube.com/embed/s3O1Xro7oAI",
            "https://www.youtube.com/embed/Ue4ZBbC8FJ8",
            "https://www.youtube.com/embed/Sk-U8ruIQyA",
            "https://www.youtube.com/embed/3OhqqT49VS0",
            "https://www.youtube.com/embed/BGpzGu9Yp6Y",
            "https://www.youtube.com/embed/mbj1RFaoyLk",
            "https://www.youtube.com/embed/3_al-rdXySQ",
            "https://www.youtube.com/embed/jEgNndDtQqY"
          ]
        },
        {
          tabId: 30,
          theme: {
            title: "Les chansons découvertes grâce au challenge",
            link:
              "https://www.youtube.com/watch?v=JDglMK9sgIQ&list=PLQGYwOtPkncaIgY1Zo_qTgzgHnN7p5dwE"
          },
          content: [
            "https://www.youtube.com/embed/NpYfKMma68A",
            "https://www.youtube.com/embed/l_S_gTnUzvg",
            "https://www.youtube.com/embed/t6dhgD1UKcY",
            "https://www.youtube.com/embed/CkyRTriM4GY",
            "https://www.youtube.com/embed/HTgqZeTyU_k",
            "https://www.youtube.com/embed/uMQp0lnRZ94",
            "https://www.youtube.com/embed/dk6MHwAFBuE",
            "https://www.youtube.com/embed/1YRW1QRKTBc",
            "https://www.youtube.com/embed/GHI5BsOu1h0"
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
