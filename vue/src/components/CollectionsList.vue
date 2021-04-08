<template>
  <div class="collections-list-main">
    <h2>LIST OF MY COLLECTIONS</h2>
    <collection-card  /> 

  </div>
</template>

<script>
import CollectionCard from "../components/CollectionCard.vue";
export default {
  name: "collections-list",

  components: [
    CollectionCard,
  ],
  
  data() {
    return {
      userCollections: [
    {
      collectionId: 222,
      userId: 2,
      name: "Spider-man Stuff",
      collectionDescription: "Behold. My Spider-man stuff.",
      username: "em",
    },
    {
      collectionId: 223,
      userId: 2,
      name: "Spider-man Stuff",
      collectionDescription: "Behold. My Spider-man stuff.",
      username: "em",
    },
  ],
    }
  },
  
  computed: {
    // listUsersCollections() {

    // }
  }
};
</script>

<style>

</style>