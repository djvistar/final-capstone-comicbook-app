<template>
  <div class="modal-backdrop">
    <div class="modal">
      <!-- <header class="modal-header">
        <slot name="header"> Add a New Collection! </slot>
      </header> -->
      <section class="modal-body">
        <slot name="body">
          <p>Add To Collection</p>
          <form v-on:submit.prevent="addToCollection()" class="addIssueForm">
            <div class="form-group">
              <select id="user-collections" name="user-collections" v-model="selectedCollection">
                <option value="0">My Collections</option>
                <option
                  v-bind:value="collection.collectionId"
                  v-for="collection in $store.state.userCollections"
                  v-bind:key="collection.collectionId"
                >
                  {{ collection.name }}
                </option>
              </select>
            </div>
            <br />
            <button class="btn btn-submit" @click="close">Submit</button>
            <button class="btn" type="button" @click="close">Cancel</button>
          </form>
        </slot>
      </section>
    </div>
  </div>
</template>
<script>
export default {
  name: "add-collection-modal",
  data() {
    return {
      selectedCollection: 0,
      selectedIssueNumber: 0,
    };
  },
  props: [
    "issueId"
  ],
  methods: {
    close() {
      this.$emit("close");
    },
    addToCollection() {
      console.log(this.selectedCollection);
      console.log(this.issueId);
      // SERVICE CALL TO ADD ISSUE # TO COLLECTION
      

    }
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
  background-color: rgba(0, 0, 0, 0.3);
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
  padding: 10px;
}

.modal-header,
.modal-footer {
  padding: 35px 10px 10px 10px;
  display: flex;
}

.modal-header {
  position: relative;
  color: #4aae9b;
  justify-content: space-between;
  font-weight: bold;
  font-size: 1.5em;
}

.modal-footer {
  border-top: 1px solid #eeeeee;
  flex-direction: column;
  justify-content: flex-end;
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