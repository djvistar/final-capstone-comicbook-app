<template>
  <div class="collections-list-main">
    <h2>LIST OF MY COLLECTIONS</h2>
   <collection-card
        v-bind:collection="collection"
        v-for="collection in $store.state.userCollections"
        v-bind:key="collection.id"
      />
  </div>
</template>

<script>
import CollectionCard from "../components/CollectionCard.vue";
export default {
  name: "collections-list",
  components: { CollectionCard },

  data() {
    return {
      
    };
  },

  computed: {
    // listUsersCollections() {
    // }
  },
};
</script>

<style>
</style>