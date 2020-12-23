<template>
  <div id="grid">
    <v-row>
      <v-col cols="12" sm="4" v-for="(link, index) in dayContent" :key="index">
        <v-card class="mx-4 my-6 pa-1" height="30vh" color="darker" flat>
          <iframe
            class="embed"
            width="100%"
            height="100%"
            :src="link"
            frameborder="0"
          ></iframe>
        </v-card>
      </v-col>
    </v-row>
  </div>
</template>

<script>
export default {
  name: "Grid",
  props: { dayContent: Array }
};
</script>

<style scoped>
#grid {
  width: 100%;
  padding: 0 5vw;
}
.embed {
  filter: grayscale(100%) brightness(120%);
}
.embed:hover {
  filter: none;
}
</style>
