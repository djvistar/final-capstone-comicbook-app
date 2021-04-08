<template>
  <div class="single-collection-main">
    <h2>SINGLE COLLECTION</h2>
    <comic-card
      v-bind:issue="issue"
      v-for="issue in collectionContents"
      v-bind:key="issue.id"
    />
  </div>
</template>

<script>
import ComicCard from "../components/ComicCard.vue";
export default {
  name: "single-collection",
  props: ["collectionId"],
  components: { ComicCard },
  data() {
    return {
      collectionContents: [
        {
          id: 1,
          title: "HardCoded",
          number: 22,
          volumeName: "SpiderGuy",
          imageURL:
            "https://comicvine1.cbsistatic.com/uploads/scale_small/11/117763/2676366-amazingspiderman001.jpg",
        },
        {
          id: 2,
          title: "HardCodedAgain",
          number: 23,
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