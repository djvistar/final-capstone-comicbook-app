<template>
  <div class="comic-card-server-main">
    <div class="comic-card-server-box">
      <div class="comic-card-server-img">
        <img v-bind:src="issue.image" />
      </div>

      <div class="comic-card-server-content-box">
        <div class="comic-card-server-content">
          <strong>{{ issue.volumeName }}</strong>
          <br />
          <em>Issue # {{ issue.issueNumber }}</em>
        </div>
      </div>
    </div>
  
    <button type="button" class="button-block remove-issue-btn" @click="showModal" v-if="$store.state.user.id===collectionOwner">
      Remove
    </button>
    <remove-issue-modal
      v-show="isModalVisible"
      @close="closeModal"
      header="Remove from Collection"
      v-bind:collectionId="collectionId"
      v-bind:issueId="issue.comicId"
    />
  </div>
</template>

<script>
import RemoveIssueModal from "../components/RemoveIssueModal.vue";
export default {
  name: "comic-card-server",
  components: { RemoveIssueModal },
  data() {
    return {
      isModalVisible: false,
      
    };
  },
  props: {
    issue: Object,
    collectionId: Number,
    collectionOwner: Number,
  },
  methods: {
    showModal() {
      this.isModalVisible = true;
    },
    closeModal() {
      this.isModalVisible = false;
    },
  },
};
</script>

<style>
.comic-card-server-main {  
  margin: 0;
  padding: 0;
}
.comic-card-server-box {
  width: 200px;
  height: 350px;
  background-color: #000;
  margin: 0;
  padding: 0;  
  border: 5px solid #fff;
  box-shadow: 4px 4px 2px 0px rgba(0, 0, 0, 0.6);
}
.comic-card-server-img {
  width: 100%;
  height: 70%;
  border-bottom: 5px solid #fff;
}
.comic-card-server-content-box {
  width: 100%;
  height: 29%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin: 0;
  padding: 0;
  background-color: #ff9a00;
}
.comic-card-server-content {
  color: #000;
  font-size: 16px;
  margin: 0;
  padding: 0;
  
}
.comic-card-server-img img {
  object-fit: contain;
  width: 100%;
  height: 100%;
  object-position: 50% 50%;
}
 .remove-issue-btn {
   margin-top: 15px;
   width: 40%;
   background-color: #ff165d;
 }
 /* .remove-issue-btn:active {
   top: .2em;
 } */
</style>