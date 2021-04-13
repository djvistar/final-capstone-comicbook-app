<template>
  <div class="modal-backdrop">
    <div class="modal">
      <section class="modal-body">
        <slot name="body">
          <div class="coll-add-logged-in" v-if="$store.state.token != ''">
            <h3>Add a New Collection!</h3>
            <form v-on:submit.prevent="submitCollection" class="collectionForm">
              <div class="form-group">
                <label for="collectionName">Collection Name:</label>
                <br />
                <input
                  id="collectionName"
                  type="text"
                  class="form-control"
                  v-model="newCollectionName"
                />
              </div>
              <br />
              <button class="btn btn-submit" @click="close">Submit</button>
              <button class="btn" type="button" @click="close">Cancel</button>
            </form>
          </div>
          <div class="coll-add-anon" v-if="$store.state.token == ''">Oops!</div>
        </slot>
      </section>
    </div>
  </div>
</template>
<script>
import CollectionService from "@/services/CollectionService.js";
export default {
  name: "add-collection-modal",
  data() {
    return {
      newCollectionName: "",
    };
  },

  methods: {
    close() {
      this.$emit("close");
    },
    submitCollection() {
      let newCollection = {
        collection_name: this.newCollectionName,
      };
      CollectionService.makeCollection(newCollection)
        .then((response) => {
          if (response.status == "201") {
            //refresh user collections
            CollectionService.getUserCollections().then((response) => {
              this.$store.state.userCollections = response.data;
            });
          }
        })
        .catch((error) => {
          console.log(error);
          this.handleErrorResponse(error);
        });
    },
  },
};
</script>
<style>
.modal-header,
.modal-footer {
  padding: 35px 10px 10px 10px;
  display: flex;
  background: blue;
}
.modal {
  width: 300px;
  height: 150px;
}
</style>