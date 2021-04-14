<template>
  <div class="modal-backdrop">
    <div class="del-coll-modal-border">
      <div class="del-coll-modal">
        <section class="del-coll-modal-body">
          <slot name="body">
            <p>Delete This Collection?</p>
            <form
              v-on:submit.prevent="deleteCollection(id)"
              class="collectionForm"
            >
              <br />
              <button class="button-block confirm-del-btn" @click="closeFinish">Yes!</button>
              <button class="button-block confirm-del-btn" type="button" @click="close">No!</button>
            </form>
          </slot>
        </section>
      </div>
    </div>
  </div>
</template>
<script>
import CollectionService from "@/services/CollectionService.js";
export default {
  name: "delete-collection-modal",
  props: ["id"],
  data() {
    return {
      collectionId: 0,
    };
  },
  methods: {
    closeFinish() {
      this.$emit("close");
      this.$router.go();
    },
    close() {
      this.$emit("close");
    },
    deleteCollection(id) {
      CollectionService.deleteCollection(id);
      CollectionService.getUserCollections().then((response) => {
        this.$store.state.userCollections = response.data;
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
  background-color: rgba(0, 0, 0, 0.3);
  display: flex;
  justify-content: center;
  align-items: center;
}

.del-coll-modal-body {
  padding: 0px 10px 10px 10px;
  margin: 0;
}
.del-coll-modal-border {
  border: 5px solid #fff;
  box-shadow: 2px 2px 20px 1px;
}
.del-coll-modal {
  background: #ffffff;
  width: 300px;
  height: 150px;
  border: 2px solid #000;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.del-coll-modal p{
  margin: 10px;
}
.del-coll-content {
  margin: 0;
  padding: 0;
}
.confirm-del-btn {
  background-color:#2B80D3;
  margin:0 10px;
  color: #fff;
  width: 35%;
}
</style>