<template>
  <div class="user-collections-main">
    <h1>{{ $store.state.user.username }}'S COLLECTIONS</h1>
    <div class="user-coll-list-cont">
      <collections-list />
    </div>
  </div>
</template>

<script>
import CollectionsList from "../components/CollectionsList.vue";

export default {
  name: "user-collections",
  data() {
    return {
      
    };
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
.user-coll-list-cont {
  margin: 30px auto;
  padding: 40px;
  background-color: #FF9A00;
  width: 80%;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
}

</style>