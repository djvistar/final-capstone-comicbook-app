<template>
  <div class="modal-backdrop">
    <div class="add-issue-border">
      <div class="add-issue-modal">
        <section class="add-issue-modal-header">Add to Collection</section>
        <section class="modal-body">
          <slot name="body">
            <form v-on:submit.prevent="addToCollection()" class="addIssueForm">
              <div class="form-group add-issue-form-area">
                <label for="user-collections">Select a Collection:</label>
                <br />
                <select
                  id="user-collections"
                  name="user-collections"
                  v-model="selectedCollection"
                >
                
                
                  <option value="0">MY COLLECTIONS</option>
                  <option
                    v-bind:value="collection.collection_id"
                    v-for="collection in $store.state.userCollections"
                    v-bind:key="collection.collection_id"
                  >
                    {{ collection.collection_name }}
                  </option>
                </select>
              </div>
              <br />
              <button class="button-block add-issue-btn" @click="close">Submit</button>
              <button class="button-block add-issue-btn" type="button" @click="close">Cancel</button>
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
  name: "add-issue-modal",
  data() {
    return {
      selectedCollection: 0,
      selectedIssueNumber: 0,
      newIssue: {
        volumeName: "",
        issueNumber: 0,
        title: "",
        image: "",
        comicId: 0,
        volumeId: 0,
      },
    };
  },
  // props: [
  //   "issueId"
  // ],
  props: {
    issue: Object,
    volumeNumber: String,
  },
  methods: {
    close() {
      this.$emit("close");
    },
    addToCollection() {
      // SERVICE CALL TO ADD ISSUE # TO COLLECTION
      this.newIssue.volumeName = this.issue.volume.name;
      this.newIssue.issueNumber = parseInt(this.issue.issue_number);
      this.newIssue.title = this.issue.name;
      this.newIssue.image = this.issue.image.small_url;
      this.newIssue.comicId = this.issue.id;
      this.newIssue.volumeId = parseInt(this.volumeNumber);

      CollectionService.addIssueToCollection(
        this.selectedCollection,
        this.newIssue
      )
        .then((response) => {
          console.log(response.status);
          if (response.status == "201") {
            //refresh user collections
            console.log("success");
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
  background-color: rgba(0, 0, 0, 0.3);
  display: flex;
  justify-content: center;
  align-items: center;
}
.add-issue-border {
  border: 5px solid #fff;
  box-shadow: 2px 2px 20px 1px;
}
.add-issue-modal {
  background: #ffffff;
  width: 300px;
  height: 300px;
  border: 2px solid #000;
  z-index: 10 !important;
}

.add-issue-modal-header {
  background-color: #ff165d;
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
.add-issue-form-area select {
  padding: 5px 10px;
  margin: 8px 10px;
  width: 75%;
  box-sizing: border-box;
}
.add-issue-btn {
  background-color: #ff165d;
  margin: 10px;
  color: #fff;
}
</style>