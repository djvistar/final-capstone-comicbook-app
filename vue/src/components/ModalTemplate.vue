<template>
  <div class="modal-backdrop">
    <div class="modal">
      <!-- <header class="modal-header">
        <slot name="header"> Add a New Collection! </slot>
      </header> -->
      <section class="modal-body">
        <slot name="body">
          <p>Title!</p>
          <form>
            <div class="form-group">
              <label for="">Lorem:</label>
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
      <!-- <footer class="modal-footer">
        <slot name="footer">
          I'm the default footer!

          <button type="button" class="btn-green" @click="close">
            Close me!
          </button>
        </slot>
      </footer> -->
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
  z-index: 2;
}

.modal {
  background: #fff;
  box-shadow: 2px 2px 20px 1px;
  overflow-x: auto;
  display: flex;
  flex-direction: column;
  padding: 10px;
  z-index: 3;
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