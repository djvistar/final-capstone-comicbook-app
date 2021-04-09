<template>
  <div class="collections-list-main">
    <h2>LIST OF MY COLLECTIONS</h2>
    <div class="collection-area">
      <collection-card
        v-bind:collection="collection"
        v-for="collection in $store.state.userCollections"
        v-bind:key="collection.id"
        
      />
    </div>
  </div>
</template>

<script>
import CollectionCard from "../components/CollectionCard.vue";
export default {
  name: "collections-list",
  components: { CollectionCard },

  data() {
    return {};
  },

  computed: {
    // listUsersCollections() {
    // }
  },

  methods: {

  },
};
</script>

<style>
.collection-area {
  display: flex;
  flex-flow: row;
  flex-wrap: wrap;
  justify-content: space-evenly;
}
.collections-list-main {
  margin: 0;

}

</style>