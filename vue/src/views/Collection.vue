<template>
  <div class="single-collection-main">
    <h2>SINGLE COLLECTION</h2>
    <collection-nav />

    <h3>Collection Name: {{ currentCollection[0].name }}</h3>
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
import CollectionNav from "../components/CollectionNav.vue";
export default {
  name: "collection",

  components: { ComicCardServer, CollectionNav },
  data() {
    return {
      currentCollection: [],
      collectionContents: [],
      collectionId: this.$route.params.id,
    };
  },
  created() {
    const activeCollectionID = this.$route.params.id;
    this.$store.commit("SET_ACTIVE_COLLECTION", activeCollectionID);

    // REPLACE THIS WITH SEARCH SERVICES
    if (this.$store.state.activeCollection == 222) {
      this.collectionContents = this.$store.state.collection222Contents;
    } else {
      this.collectionContents = this.$store.state.collection223Contents;
    }
    this.currentCollection = this.$store.state.userCollections.filter(
      (collection) => {
        return this.$store.state.activeCollection == collection.collectionId;
      }
    );
  },
};
</script>

<style>
</style>