<template>
  <div class="coll-card-main">
    <div class="coll-card-box">
      <div class="coll-card-name">
        {{ collection.collection_name }}
      </div>
      <div class="coll-card-img">&nbsp;</div>
      <div class="coll-btn-box">
        <button v-on:click="selectActiveCollection(collection.collection_id)" class="button-block coll-btn-add">
          View
        </button>
        <button type="button" class="button-block coll-btn-del" @click="showModal">Delete</button>
        <delete-collection-modal
          v-show="isModalVisible"
          @close="closeModal"
          header="Delete Collection"
          v-bind:id="collection.collection_id"
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
  background-color:#ff165d;
  
}
.coll-card-img {
  background-image: url("../assets/collection-cover.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-size: 210px auto;
  height: 100%;

}

.coll-btn-box {
  border-top: 5px solid #fff;
  padding: 8px 10%;
  display: flex;
  justify-content: space-between;
  background-color: #2B80D3;
}

.coll-btn-add {
  background-color: #fff;
  margin: 0;
  color: #ff165d;
  color: #000;
  width:45%;
}
.coll-btn-del {
  background-color: #fff;
  color: #000;
  margin: 0;
  width:45%;
}
</style>