import Vue from "vue";
import Vuetify from "vuetify/lib/framework";

Vue.use(Vuetify);

export default new Vuetify({
  theme: {
    themes: {
      light: {
        primary: "#bb00bb",
        secondary: "#8bcf4a",
        accent: "#03a9f4",
        error: "#f44336",
        warning: "#ffc107",
        info: "#58f",
        success: "#4cbf55",
      },
    },
  },
});
