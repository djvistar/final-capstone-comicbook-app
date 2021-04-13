<template>
  <div class="modal-backdrop">
    <div class="modal">
      <section class="modal-body">
        <slot name="body">
          <p>Remove This Issue?</p>
          <form
            v-on:submit.prevent="deleteIssue(issueId, collectionId)"
            class="collectionForm"
          >
            <br />
            <button class="btn btn-submit" @click="closeFinish">Yes!</button>
            <button class="btn" type="button" @click="close">No!</button>
          </form>
        </slot>
      </section>
    </div>
  </div>
</template>
<script>
import CollectionService from "@/services/CollectionService.js";
export default {
  name: "delete-issue-modal",
  props: ["issueId", "collectionId"],
  data() {
    return {};
  },
  methods: {
    closeFinish() {
      this.$emit("close");
      this.$router.go();
    },
    close() {
      this.$emit("close");
    },
    deleteIssue(issueId, collectionId) {
        console.log(issueId);
        console.log(collectionId);
      CollectionService.removeIssueFromCollection(issueId, collectionId);
      console.log("success");
    //   CollectionService.getUserCollections().then((response) => {
    //     this.$store.state.userCollections = response.data;
        
    //   });
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