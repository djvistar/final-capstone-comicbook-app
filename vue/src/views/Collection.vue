
<template>
  <div class="single-collection-main">
    <h1>{{ currentCollection.collection_name }}</h1>

    <p>Collection Owner: {{ currentCollection.username }}</p>
    <p>Collection Size: {{ currentCollectionIssues.length }}</p>
    <p>Collection ID: {{ this.$route.params.id }}</p>
    <collection-nav />
    <div class="collection-issues-area">
      <comic-card-server
        v-bind:issue="issue"
        v-for="issue in currentCollectionIssues"
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
      currentCollection: {},
      currentCollectionIssues: [],
      collectionId: this.$route.params.id,
      currentName: "",
    };
  },
  methods: {},
  mounted() {
    this.$store.commit("SET_ACTIVE_COLLECTION", this.activeCollectionID);

    CollectionService.getIssuesFromCollection(this.$route.params.id).then(
      (response) => {
        this.currentCollectionIssues = response.data;
      }
    );
    CollectionService.getCollection(this.$route.params.id).then((response) => {
      this.currentCollection = response.data;
    });
  },
};
</script>

<style>
.collection-issues-area {
  width: 90%;
  margin: 0 auto;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-around;
}
.comic-card-server-single {
  margin: 25px;
}
</style>