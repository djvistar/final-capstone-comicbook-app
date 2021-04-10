<template>
  <div class="user-collections-main">
    <h1>MY COLLECTIONS</h1>
    <collections-list />
  </div>
</template>

<script>
import CollectionsList from "../components/CollectionsList.vue";

export default {
  name: "user-collections",
  data() {
    return {};
  },
  components: {
    CollectionsList,
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