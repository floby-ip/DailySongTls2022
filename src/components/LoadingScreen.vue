<template>
  <div id="loading">
    <p id="title">
      30 jours, 30 thèmes<br />
      Des centaines de chansons<br />
      <span id="company">Ippon Technologies</span> a relevé le défi<br />
    </p>
    <div id="bar">
      <v-progress-linear indeterminate color="#121212" height="2" rounded />
    </div>
  </div>
</template>

<script>
export default {
  name: "LoadingScreen",
  props: ["isLoading"],
  data() {
    return {
      pleaseWaitInstance: null
    };
  },
  mounted() {
    this.updatePleaseWait();
  },
  beforeUpdate() {
    this.updatePleaseWait();
  },
  methods: {
    updatePleaseWait() {
      if (this.isLoading && this.pleaseWaitInstance == null) {
        this.pleaseWaitInstance = {};
      }
      if (!this.isLoading && this.pleaseWaitInstance != null) {
        this.pleaseWaitInstance.finish();
      }
    }
  }
};
</script>

<style scoped>
#loading {
  width: 100vw;
  height: 100vh;
  background: #121212;
}
#title {
  width: 100%;
  height: 48vh;
  padding-top: 20vh;
  padding-bottom: 20vh;
  padding-left: 10vw;
  padding-right: 10vw;
  text-align: center;
  vertical-align: text-bottom;
  font: 1.8rem "Roboto", sans-serif;
}
#title #company {
  color: #f25053;
  font-weight: bold;
}
.v-progress-linear {
  width: 80vw;
  margin: auto;
  background: linear-gradient(to right, #ff0f7b, #f89b29) !important;
}
</style>
