<template>
  <div class="collection-nav-main">
    COLLECTION NAV
    <br />
    <form v-on:submit.prevent="selectActiveCollection(value)">
      <label for="user-collections">View a Collection: </label>
      <select id="user-collections" name="user-collections">
        <option value="">My Collections</option>
        <option v-bind:value="collection.id"
        v-for="collection in $store.state.userCollections"
        v-bind:key="collection.id">{{collection.name}}</option>
      </select>
      <input type="submit" />
    </form>

   &nbsp;
    <button v-on:click="resetShowAllCollections()">
      Back to All Collections
    </button>
  </div>
</template>

<script>
export default {
  name: "collection-nav",
  methods: {
    resetShowAllCollections() {
      this.$store.commit("RESET_SHOW_ALL_COLLECTIONS");
    },
    selectActiveCollection(id) {
      this.$store.commit("SET_ACTIVE_COLLECTION", id);
      
    },
  },
};
</script>

<style>
</style>