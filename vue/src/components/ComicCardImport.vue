<template>
  <div class="comic-card-import-main">
    <div class="comic-card-import-box">
      <div class="comic-card-import-img">
        <img id="image" v-bind:src="issue.image.small_url" />
      </div>

      <div class="comic-card-import-content-box">
        <div class="comic-card-import-content">
          <strong>{{ issue.volume.name }}</strong>
          <br />
          <em>Issue # {{ issue.issue_number }}</em>
        </div>
      </div>
    </div>
    <button
      type="button"
      class="button-block add-issue-btn"
      @click="showModal"
      v-if="$store.state.token != ''"
    >
      Add to Collection
    </button>
    <add-issue-modal
      v-show="isModalVisible"
      @close="closeModal"
      header="Add to Collection"
      v-bind:volumeNumber="volume"
      v-bind:issue="issue"
    />
  </div>
</template>

<script>
import AddIssueModal from "../components/AddIssueModal.vue";
export default {
  //It doesn't like 'API', so we'll call it an import
  name: "comic-card-import",
  components: { AddIssueModal },

  data() {
    return {
      isModalVisible: false,
      isInCollection: false,
    };
  },
  props: {
    issue: Object,
    volume: String,
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

<style scoped>
.comic-card-import-main {
  margin: 20px;
  padding: 0;
}
.comic-card-import-box {
  width: 200px;
  height: 300px;
  background-color: #ff9a00;
  margin: 0;
  padding: 0;
  border: 5px solid #fff;
  box-shadow: 4px 4px 2px 0px rgba(0, 0, 0, 0.6);
}
.comic-card-import-img {
  width: 100%;
  height: 70%;
  border-bottom: 5px solid #fff;
  background-color: #000;
}
.comic-card-import-img img {
  object-fit: cover;
  width: 100%;
  height: 100%;
  object-position: 50% 50%;
}

.comic-card-import-content-box {
  width: 100%;
  height: 29%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin: 0;
  padding: 0;
}
.comic-card-import-content {
  color: #000;
  font-size: 16px;
  margin: 0;
  padding: 0;
}
.comic-card-info {
  width: 100%;
  color: #000;
  font-size: 14px;
}

.add-issue-btn {
  margin-top: 15px;
  width: 80%;
  background-color: #ff165d;
}
/* .add-issue-btn:active {
  top: 0.2em;
} */
/* 
.issue-title {
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2; -number of lines to show
  -webkit-box-orient: vertical;
}
*/
</style>