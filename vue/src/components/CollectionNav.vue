<template>
  <div class="collection-nav-main">
    COLLECTION NAV
    <br />

    <!-- <form v-on:submit.prevent="selectActiveCollection()" id="collectionNav">
      <label for="user-collections">View a Collection: </label>
      <select id="user-collections" name="user-collections">
        <option value="0">My Collections</option>
        <option
          v-bind:value="collection.collectionId"
          v-for="collection in $store.state.userCollections"
          v-bind:key="collection.collectionId"
        >
          {{ collection.name }}
        </option>
      </select>
      <input type="submit" />
    </form> -->

    <button v-on:click="resetShowAllCollections()">
      Back to All Collections
    </button>
  </div>
</template>

<script>

export default {
  name: "collection-nav",
  
  data() {
    return {
      selectedCollection: 0,
    };
  },
  methods: {
    resetShowAllCollections() {
      this.$store.commit("RESET_SHOW_ALL_COLLECTIONS");
      this.$router.push("../collections");
    },
    selectActiveCollection() {
      console.log();

      // this.$store.commit("SET_ACTIVE_COLLECTION", id);
    },
  },
};
</script>

<style>
.collection-nav-main {
  background-color: lightseagreen;
}
</style>