import Vue from "vue";
import Vuetify from "vuetify/lib";
import fr from "vuetify/es5/locale/fr";

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
    dark: true,
    options: { customProperties: true },
    themes: {
      dark: {
        darker: "#0c0d0d",
        accent: "#03045e",
        lighter: "#f7efe7"
      }
    }
  },
  lang: {
    locales: { fr },
    current: "fr"
  }
});
