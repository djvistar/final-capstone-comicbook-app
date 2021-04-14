<template>
  <div class="collections-list-main">
    <!-- MODAL -->
    <div class="coll-list-btn-cont">
      <button
        type="button"
        class="button-block collection-btn"
        @click="showModal"
      >
        Add New Collection
      </button>
      <add-collection-modal
        v-show="isModalVisible"
        @close="closeModal"
        header="Add Collection"
      />
    </div>

    <div class="collection-area">
      <collection-card
        v-bind:collection="collection"
        v-for="collection in userCollectionList"
        v-bind:key="collection.id"
        class="coll-card-single"
      />
    </div>
    <div id="empty-collection" v-if="userCollectionList.length == 0">
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

  methods: {
    showModal() {
      this.isModalVisible = true;
    },
    closeModal() {
      this.isModalVisible = false;
    },
  },
  computed: {
    userCollectionList() {
  
      let userList =  this.$store.state.userCollections;
      return userList;
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

.collection-btn {
  background-color: #ff165d;
  font-size: 16px;
}
/* .collection-btn:active {
  top: 0.2em;
} */
.coll-list-btn-cont {
  padding: 0 0 10px 0;
  margin: 0 auto;
  display: flex;
  
}

.coll-card-single {
  margin: 15px;
}
</style>