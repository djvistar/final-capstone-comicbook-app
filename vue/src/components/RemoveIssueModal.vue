<template>
  <div class="modal-backdrop">
    <div class="remove-issue-border">
      <div class="remove-issue-modal">
        <div class="remove-issue-content">
          <section class="remove-issue-modal-body">
            <slot name="body">
              <p>Remove This Issue?</p>
              <form
                v-on:submit.prevent="deleteIssue(issueId, collectionId)"
                class="collectionForm"
              >
                <button
                  class="button-block confirm-remove-btn"
                  @click="closeFinish"
                >
                  Confirm
                </button>
                <button
                  class="button-block confirm-remove-btn"
                  type="button"
                  @click="close"
                >
                  Cancel
                </button>
              </form>
            </slot>
          </section>
        </div>
      </div>
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
.remove-issue-modal-body {
  padding: 0px 10px 10px 10px;
  margin: 0;
}
.remove-issue-border {
  border: 5px solid #fff;
  box-shadow: 2px 2px 20px 1px;
}
.remove-issue-modal {
  background: #ffffff;
  width: 300px;
  height: 150px;
  border: 2px solid #000;
  display: flex;
  flex-direction: column;
  justify-content: center;
}
.remove-issue-modal p{
  margin: 10px;
}
.remove-issue-content {
  margin: 0;
  padding: 0;
}
.confirm-remove-btn {
  background-color: #ff165d;
  margin:0 10px;
  color: #fff;
  width: 35%;
}

</style>