<template>
  <div>
    <ThumbNail />
  </div>
</template>

<script lang="ts">
import Vue from "vue";
import { Component } from "vue-property-decorator";
import ThumbNail from "@/components/ThumbNail.vue";

@Component({
  components: {
    ThumbNail,
  },
})
export default class HomeView extends Vue {}
</script>

<style>
html {
  overflow-y: hidden;
}
</style>
