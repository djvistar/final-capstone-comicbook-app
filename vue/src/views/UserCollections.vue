<template>
  <div class="user-collections-main">
   <h1>USER COLLECTIONS</h1>
    <br />
    <collections-list  v-if="showAllCollections" />
    <collection-nav  v-if="!showAllCollections" />
    <single-collection  v-if="!showAllCollections" />

  </div>
</template>

<script>
import CollectionsList from "../components/CollectionsList.vue";
import SingleCollection from "../components/SingleCollection.vue";
import CollectionNav from "../components/CollectionNav.vue";
export default {
  name: "user-collections",
  data() {
    return {
      showAllCollections: false,
    };
  },
  components: {
    CollectionsList,
    SingleCollection,
    CollectionNav,
  },
};
</script>

<style>
</style>