
<template>
  <div class="single-collection-main">
    <h1>{{ currentCollection.collection_name }}</h1>
    <div class="col-info-box">
      <div class="col-info-piece">
        <p>Collection Owner:</p>
        <p>{{ currentCollection.username }}</p>
      </div>

      <button
        v-on:click="backToCollections()"
        class="button-block col-back-btn"
        v-if="$store.state.user.id===currentCollection.user_id"
      >
        View {{ currentCollection.username }}'s Other Collections
      </button>
      <button
        v-on:click="registerToday()"
        class="button-block col-back-btn"
        v-if="$store.state.token == ''"
      >
        Register and Make Your Own!
      </button>

      <div class="col-info-piece">
        <p>Collection Size:</p>
        <p>{{ currentCollectionIssues.length }}</p>
      </div>
    </div>
    <div
      class="collection-issues-area"
      v-if="currentCollectionIssues.length > 0"
    >
      <comic-card-server
        v-bind:issue="issue"
        v-for="issue in currentCollectionIssues"
        v-bind:key="issue.id"
        class="comic-card-server-single"
        v-bind:collectionId="currentCollection.collection_id"
        v-bind:collectionOwner="currentCollection.user_id"
      />
    </div>
    <div class="empty-issues" v-if="currentCollectionIssues.length == 0">
      Uh-Oh! You should probably add some comics!
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
  components: {
    ComicCardServer,
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
    registerToday() {
      this.$router.push("../register");
    }
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
  background: #3ec1d3;
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

.col-back-btn {
  background-color: #ff165d;
  width: 20%;
  height: 60%;
  font-size: 16px;
  padding: 10px;
}
/* .col-back-btn:active {
  top: 0.2em;
} */
.empty-issues {
  margin: 30px auto;
  padding: 20px 40px;
  background-color: #f8f59b;
  text-align: center;
  width: 60%;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
}
</style>