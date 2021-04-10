<template>
  <div class="collections-list-main">
    <!-- MODAL -->
    <button type="button" class="button-block collection-btn" @click="showModal">New Collection</button>
    <add-collection-modal
      v-show="isModalVisible"
      @close="closeModal"
      header="Add Collection"
    />

    <br />
    <div class="collection-area">
      <collection-card
        v-bind:collection="collection"
        v-for="collection in $store.state.userCollections"
        v-bind:key="collection.id"
      />
    </div>
    <div id="empty-collection" v-if="$store.state.userCollections.length == 0">
      Uh-Oh! You should probably add a collection!
    </div>
  </div>
</template>

<script>
import AddCollectionModal from "../components/AddCollectionModal.vue";
import CollectionCard from "../components/CollectionCard.vue";
export default {
  name: "collections-list",
  components: { CollectionCard, AddCollectionModal },

  data() {
    return {
      isModalVisible: false,
    };
  },

  computed: {
    // listUsersCollections() {
    // }
  },

  methods: {
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
.collection-area {
  display: flex;
  flex-flow: row;
  flex-wrap: wrap;
  justify-content: space-evenly;
}
.collections-list-main {
  margin: 10px 0 0 0;
  background-color: lightcoral;
}
.collection-btn {
  background-color: #FF165D;
}
</style>