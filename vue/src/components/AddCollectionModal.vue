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
.modal-backdrop {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  background-color: rgba(0, 0, 0, 0.4);
  display: flex;
  justify-content: center;
  align-items: center;
}

.modal {
  background: #ffffff;
  box-shadow: 2px 2px 20px 1px;
  overflow-x: auto;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  padding: 10px;
  width: 300px;
  height: 150px;
}

.modal-body {
  position: relative;
  padding: 0px 10px 10px 10px;
}

.btn-close {
  position: absolute;
  top: 0;
  right: 0;
  border: none;
  font-size: 20px;
  padding: 10px;
  cursor: pointer;
  font-weight: bold;
  color: #4aae9b;
  background: transparent;
}

.btn-green {
  color: white;
  background: #4aae9b;
  border: 1px solid #4aae9b;
  border-radius: 2px;
}
</style>