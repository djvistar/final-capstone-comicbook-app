<template>
  <div class="single-collection-main">
    <h1>COLLECTION NAME</h1>
    <!-- <h1>{{ currentCollection[0].name }}</h1> -->
    <p>Collection Size: {{ $store.state.currentCollection.length }}</p>
    <p>Collection ID: {{ this.$route.params.id }}</p>
    <collection-nav />
    <div class="collection-issues-area">
      <comic-card-server
        v-bind:issue="issue"
        v-for="issue in $store.state.currentCollection"
        v-bind:key="issue.id"
        class="comic-card-server-single"
      />
    </div>
  </div>
</template>

<script>
import ComicCardServer from "../components/ComicCardServer.vue";
import CollectionNav from "../components/CollectionNav.vue";
// import CollectionService from "@/services/CollectionService.js";
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
    // const activeCollectionID = this.$route.params.id;
    // this.$store.commit("SET_ACTIVE_COLLECTION", activeCollectionID);
    // REPLACE THIS WITH SEARCH SERVICES
    // if (this.$store.state.activeCollection == 222) {
    //   this.collectionContents = this.$store.state.collection222Contents;
    // } else {
    //   this.collectionContents = this.$store.state.collection223Contents;
    // }
    // this.currentCollection = this.$store.state.userCollections.filter(
    //   (collection) => {
    //     return this.$store.state.activeCollection == collection.collectionId;
    //   }
    // );
  },
};
</script>

<style>
.collection-issues-area {
  width: 90%;
  margin: 0 auto;

  display: flex;
  align-items: center;
  justify-content: space-around;
}
.comic-card-server-single {
  margin: 25px;
}
</style>