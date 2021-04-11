<template>
  <div class="coll-card-main">
    <div class="coll-card-box">
      <div class="coll-card-name">
        {{ collection.name }}
      </div>
      <div class="coll-card-img">image</div>
      <div class="coll-btn-box">
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
  </div>
</template>

<script>
import DeleteCollectionModal from "../components/DeleteCollectionModal.vue";

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
      this.$router.push("../collection/" + id);
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
.coll-card-main {
  width: 200px;
  height: 250px;
  background-color: #3ec1d3;
  border: 5px solid #fff;
  box-shadow:  4px 4px 2px 0px rgba(0, 0, 0, 0.6);
}
.coll-card-box {
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}
.coll-card-name {
  border-bottom: 5px solid #fff;
  font-size: 18px;
  font-weight: bold;
  color: #fff;
  padding: 5px;
  background-color: #2B80D3;
  
}
.coll-btn-box {
  border-top: 5px solid #fff;
  padding: 8px 10%;
  display: flex;
  justify-content: space-between;
}
</style>