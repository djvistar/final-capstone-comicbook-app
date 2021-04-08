<template>
  <div class="single-collection-main">
    <h2>SINGLE COLLECTION</h2>
   <h3>Collection Name:  {{collectionInfo.name }}</h3>
   <p>Collection ID: {{collectionId}}</p>
   <p>Collection Size: {{ collectionContents.length}}</p>
   <comic-card-db />
       <p
      v-bind:issue="issue"
      v-for="issue in collectionContents"
      v-bind:key="issue.id"
    >Hi</p>
    <br />
    TEST
  </div>
</template>

<script>
import ComicCardDB from "../components/ComicCardDB.vue";
export default {
  name: "single-collection",
  props: ["collectionId"],
  components: {ComicCardDB},
  data() {
    return {
      collectionInfo: this.$store.state.currentCollection,
      collectionContents: [
        {
          id: 1,
          title: "HardCoded",
          issue_number: 22,
          volumeName: "SpiderGuy",
          imageURL:
            "https://comicvine1.cbsistatic.com/uploads/scale_small/11/117763/2676366-amazingspiderman001.jpg",
        },
        {
          id: 2,
          title: "HardCodedAgain",
          issue_number: 23,
          volumeName: "SpiderGuy",
          imageURL:
            "https://comicvine1.cbsistatic.com/uploads/scale_small/11/117763/2676366-amazingspiderman001.jpg",
        },
      ],
    };
  },
};
</script>

<style>
</style>