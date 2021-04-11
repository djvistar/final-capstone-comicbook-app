
<template>
  <div class="single-collection-main">
    <h1>COLLECTION NAME</h1>
    <!-- <h1>{{ currentCollection[0].name }}</h1> -->
    <p>Collection Size: {{ currentCollection.length }}</p>
    <p>Collection ID: {{ this.$route.params.id }}</p>
    <collection-nav />
    <div class="collection-issues-area">
      <comic-card-server
        v-bind:issue="issue"
        v-for="issue in currentCollection"
        v-bind:key="issue.id"
        class="comic-card-server-single"
      />
    </div>
  </div>
</template>

<script>
import ComicCardServer from "../components/ComicCardServer.vue";
import CollectionNav from "../components/CollectionNav.vue";

/* eslint-disable-next-line */
import CollectionService from "@/services/CollectionService.js";

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
  methods: {},
  mounted() {
    this.$store.commit("SET_ACTIVE_COLLECTION", this.activeCollectionID);
    CollectionService.getIssuesFromCollection(this.$route.params.id).then(
      (response) => {
        this.currentCollection = response.data;
        console.log(this.currentCollection);
      }
    );
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