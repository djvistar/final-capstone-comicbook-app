<template>
  <div class="modal-backdrop">
    <div class="add-coll-border">
      <div class="add-coll-modal">
        <section class="add-coll-modal-header">Add a New Collection!</section>
        <section class="modal-body">
          <slot name="body">
            <div class="coll-add-logged-in" v-if="$store.state.token != ''">
              <form
                v-on:submit.prevent="submitCollection"
                class="collectionForm"
              >
                <div class="form-group add-col-form-area">
                  <label for="collectionName">New Collection Name:</label>
                  <br />
                  <input
                    id="collectionName"
                    type="text"
                    class="form-control"
                    v-model="newCollectionName"
                    required
                  />
                </div>
                <br />
                <button class="button-block add-col-btn btn-submit" @click="close">Submit</button>
                <button class="button-block add-col-btn btn" type="button" @click="close">Cancel</button>
              </form>
            </div>
            <div class="coll-add-anon" v-if="$store.state.token == ''">
              Oops!
            </div>
          </slot>
        </section>
      </div>
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
.add-coll-border {
  border: 5px solid #fff;
  box-shadow: 2px 2px 20px 1px;
}
.add-coll-modal {
  background: #ffffff;
  width: 300px;
  height: 300px;
  border: 2px solid #000;
  z-index: 10 !important;
}

.add-coll-modal-header {
  background-color: #2B80D3;
  color: #fff;
  font-weight: bold;
  font-size: 22px;
  height: 25%;
  text-align: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.modal-body {
  padding: 0px 10px 10px 10px;
  margin-top: 30px;
  
}
.add-col-form-area input[type="text"] {
  padding: 5px 10px;
  margin: 8px 10px;
  width: 75%;
  box-sizing: border-box;
}
.add-col-btn {
  background-color: #2B80D3;
  margin: 10px;
  color: #fff;
}

</style>