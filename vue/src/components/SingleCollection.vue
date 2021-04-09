<template>
  <div class="single-collection-main">
    <h2>SINGLE COLLECTION</h2>
    
    <h3>Collection Name: {{ collectionInfo[0].name }}</h3>
    <p>Collection ID: {{ collectionId }}</p>
    <p>Collection Size: {{ collectionContents.length }}</p>
    <comic-card-server
      v-bind:issue="issue"
      v-for="issue in collectionContents"
      v-bind:key="issue.id"
    />
    <br />
    TEST
  </div>
</template>

<script>

import ComicCardServer from "../components/ComicCardServer.vue";
export default {
  name: "single-collection",
  props: ["collectionId"],
  components: { ComicCardServer, },
  data() {
    return {
      currentCollection: [],
      collectionContents: [],
      
    };
  },
  
  created() {
    if (this.$store.state.activeCollection == 222) {
      this.collectionContents = this.$store.state.collection222Contents;
    } else {
      this.collectionContents = this.$store.state.collection223Contents;
    }
    this.collectionInfo = this.$store.state.userCollections.filter(
      (collection) => {
        return this.$store.state.activeCollection === collection.collectionId;
      }
    );
  },
};
</script>

<style>
</style>