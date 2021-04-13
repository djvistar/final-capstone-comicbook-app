
<template>
  <div class="single-collection-main">
    <h1>{{ currentCollection.collection_name }}</h1>
    <div class="col-info-box">
      <div class="col-info-piece">
        <p>Collection Owner:</p>
        <p>{{ currentCollection.username }}</p>
      </div>
      
        <button v-on:click="backToCollections()" class="button-block col-back-btn">
          View {{currentCollection.username }}'s Other Collections
        </button>
      

      <div class="col-info-piece">
        <p>Collection Size:</p>
        <p>{{ currentCollectionIssues.length }}</p>
      </div>
    </div>
    <!-- <collection-nav /> -->
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
// import CollectionNav from "../components/CollectionNav.vue";

/* eslint-disable-next-line */
import CollectionService from "@/services/CollectionService.js";

export default {
  name: "collection",
  components: { ComicCardServer, 
  // CollectionNav 
  },
  data() {
    return {
      currentCollection: {},
      currentCollectionIssues: [],
      collectionId: this.$route.params.id,
      currentName: "",
    };
  },
  methods: {
    backToCollections() {
      this.$router.push("../collections");
    },
  },
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
  padding: 10px;
  margin: 0 auto;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-around;
  background:#3ec1d3;
  box-shadow: inset 0 -0.6em 0 -0.25em rgba(0, 0, 0, 0.17);
}
.comic-card-server-single {
  margin: 25px;
}
.col-info-box {
  margin: 30px auto;
  padding: 0;
  text-align: center;
  width: 60%;
  display: flex;
  justify-content: space-around;
  align-items: center;
}
.col-info-piece {
  padding: 10px;
  width: 25%;
  background: #f8f59b;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
}
.col-info-link {
  padding: 10px;
  width: 15%;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
}
.col-back-btn {
  background-color: #ff165d;
  width: 15%;
  height: 60%;
}
.col-back-btn:active {
  top: .2em;
}
</style>