<template>
  <div id="thumbnail_wrapper">
    <v-container fluid class="fill-height">
      <v-row justify="center" align="center" no-gutters>
        <v-col cols="8">
          <div
            style="
              height: 100%;
              width: 100%;
              display: flex;
              justify-content: center;
              align-items: center;
            "
          >
            <LayeredTitle text="Fruchtis" />
          </div>
        </v-col>
      </v-row>
    </v-container>
  </div>
</template>

<script>
import Vue from "vue";
import { Component } from "vue-property-decorator";
import LayeredTitle from "@/components/LayeredTitle.vue";

@Component({
  components: {
    LayeredTitle,
  },
})
export default class ThumbNail extends Vue {}
</script>

<style>
#thumbnail_wrapper {
  width: 100vw;
  height: 90vh;
  background-image: url("../assets/wiese_flacher.svg");
  background-size: cover;
}
</style>
