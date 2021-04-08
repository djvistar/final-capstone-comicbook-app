<template>
  <div class="user-collections-main">
    <h1>USER COLLECTIONS</h1>
    <br />
    <collections-list v-if="$store.state.showAllCollections" />
    <collection-nav v-if="!$store.state.showAllCollections" />
    <single-collection v-if="!$store.state.showAllCollections" v-bind:collectionId="$store.state.activeCollection" />
  </div>
</template>

<script>
import CollectionsList from "../components/CollectionsList.vue";
import SingleCollection from "../components/SingleCollection.vue";
import CollectionNav from "../components/CollectionNav.vue";

export default {
  name: "user-collections",
  data() {
    return {};
  },
  components: {
    CollectionsList,
    SingleCollection,
    CollectionNav,
    
  },
  methods: {
    toggleShowAllCollections() {
      this.$store.commit("TOGGLE_SHOW_ALL_COLLECTIONS");
    },
  },
  created() {
    this.$store.commit("RESET_SHOW_ALL_COLLECTIONS");
  },
};
</script>

<style>
</style>