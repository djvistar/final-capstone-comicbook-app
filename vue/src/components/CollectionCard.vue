<template>
  <div class="collection-card-main">
    <div id="card-box">
      {{ collection.name }}
      <br />
      <button v-on:click="selectActiveCollection(collection.collectionId)">
        View
      </button>
      <button type="button" class="btn" @click="showModal">Delete</button>
      <delete-collection-modal
        v-show="isModalVisible"
        @close="closeModal"
        header="Delete Collection"
        v-bind:id="collection.collectionId"
      />
    </div>
  </div>
</template>

<script>
import DeleteCollectionModal from "../components/DeleteCollectionModal.vue";
import CollectionService from "@/services/CollectionService.js";
export default {
  name: "collection-card",
  props: { collection: Object },
  components: { DeleteCollectionModal },
  data() {
    return {
      isModalVisible: false,
    };
  },
  methods: {
    selectActiveCollection(id) {
      this.$store.commit("SET_ACTIVE_COLLECTION", id);
      // this.$store.commit("TOGGLE_SHOW_ALL_COLLECTIONS");
      this.$router.push("../collection/" + id);
      console.log(id);
      CollectionService.getIssuesFromCollection(id).then((response) => {
        this.$store.commit("LOAD_CURRENT_COLLECTION_CONTENT", response.data);
      });
    },
    showModal() {
      this.isModalVisible = true;
    },
    closeModal() {
      this.isModalVisible = false;
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