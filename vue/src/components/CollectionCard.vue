<template>
  <div class="collection-card-main">
    <div id="card-box">
      {{ collection.name }}
      <br />
      <button v-on:click="selectActiveCollection(collection.collectionId)">View</button>
      <button >Delete</button>
    </div>
  </div>
</template>

<script>
export default {
  name: "collection-card",
  props: {collection: Object},
  methods: {
    selectActiveCollection(id) {
      this.$store.commit("SET_ACTIVE_COLLECTION", id);
      console.log(this.$store.state.activeCollection);
      this.$store.commit("TOGGLE_SHOW_ALL_COLLECTIONS");
    },
  },
};
</script>

<style>
#card-box {
  width: 150px;
  height: 250px;
  background-color: lightgreen;
}
</style>