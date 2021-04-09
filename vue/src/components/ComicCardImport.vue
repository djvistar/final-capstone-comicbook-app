<template>
  <div class="comic-card-import-main">
    <div class="comic-card-info">
      <button type="button" class="btn" @click="showModal">Add to Collection</button>
      <add-issue-modal
        v-show="isModalVisible"
        @close="closeModal"
        header="Add to Collection"
      />
      <img id="image" v-bind:src="issue.image.small_url" />
      <div id="volume">Series: {{ issue.volume.name }}</div>
      <div id="issue_number">Issue # {{ issue.issue_number }}</div>
      <div id="name" class="issue-title">{{ issue.name }}</div>
    </div>
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
.comic-card-import-main img {
  width: 150px;
}
.comic-card-import-main {
  background-color: lightcoral;
  width: 200px;
  margin: 5px;
  padding: 25px;
  border-radius: 10px;
}
.comic-card-info {
  width: 100%;
  color: #000;
  font-size: 14px;
}

.issue-title {
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2; /* number of lines to show */
  -webkit-box-orient: vertical;
}

/* .comic-card-import-main {
  max-width: 240px;
  max-height: 240px;
  margin: 25px;
  padding: 10px;
  background-color: #00afef;
  color: rgb(0, 0, 0);
  border: solid 1px #777;
  display: flex;
  justify-items: center;
  align-content: flex-start;
} */
/* .comic-card-info {
  padding: 2px 2px;
  display: grid;
  background-color: #b1ee0b;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 1fr 1fr 1fr 0.5fr;
  grid-template-areas:
    "image issue_number"
    "image name"
    "image name"
    "image volume";
} */

/* #name {
  grid-area: name;
  text-shadow: 1px 1px 0 #444;
  word-wrap: break-word;
  font-size: 1vw;
  
}

#issue_number {
  grid-area: issue_number;
  font-size: 1vw, larger;
}
#volume {
  grid-area: volume;
  font-size: 1vw;
  word-wrap: break-word;
}
#summary {
  grid-area: summary;
} */
</style>