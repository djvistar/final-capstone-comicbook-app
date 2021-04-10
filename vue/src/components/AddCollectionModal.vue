<template>
  <div class="modal-backdrop">
    <div class="modal">
      <!-- <header class="modal-header">
        <slot name="header"> Add a New Collection! </slot>
      </header> -->
      <section class="modal-body">
        <slot name="body">
          <p>Add a New Collection!</p>
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
      newCollectionName: "",
    };
  },
  methods: {
    close() {
      this.$emit("close");
    },
    submitCollection() {
      let newCollection = {
        collectionId: 225,
        userId: 2,
        name: this.newCollectionName,
        collectionDescription: "",
        username: "em",
      };
      this.$store.commit("ADD_COLLECTION", newCollection);
    },
  },
};
</script>
<style>

</style>