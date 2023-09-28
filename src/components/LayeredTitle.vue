<template>
  <div id="title_wrapper">{{ text }}</div>
</template>

<script lang="ts">
import { Vue, Component, Prop } from "vue-property-decorator";

@Component({
  components: {},
})
export default class LayeredTitle extends Vue {
  @Prop() text = "";
}
</script>

<style scoped lang="scss">
@font-face {
  font-family: SunnySpells;
  src: url(../assets/fonts/sunny-spells-font/SunnyspellsRegular-MV9ze.otf);
}

#title_wrapper {
  font-size: 40vmin;
  text-align: center;
  height: 58vh;
  line-height: 50vh;
  color: #fcfcfd;
  font-family: SunnySpells, cursive;
  font-weight: 700;
  letter-spacing: 2vw;
  width: fit-content;
  padding-right: 25px;
  text-shadow: 5px 5px 0px #eb452b, 10px 10px 0px #efa032, 15px 15px 0px #46b59b,
    20px 20px 0px #017e7f, 25px 25px 0px #052939;
}
</style>
