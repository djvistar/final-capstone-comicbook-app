<template>
  <div class="modal-backdrop">
    <div class="modal">
      <header class="modal-header">
        <slot name="header"> Add a New Collection! </slot>
        <button type="button" class="btn-close" @click="close">x</button>
      </header>

      <section class="modal-body">
        <slot name="body">
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
            <button class="btn btn-submit" @click="close">Submit</button>
          </form>
        </slot>
      </section>

      <footer class="modal-footer">
        <button type="button" class="btn-green" @click="close">
          Close Modal
        </button>
      </footer>
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
  padding: 30px;
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
  padding: 20px 10px;
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