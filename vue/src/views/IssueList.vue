<template>
  <div>
    <h1>SEARCH RESULTS</h1>

    <div class="issue-list-main">
      <comic-card-import
        v-bind:issue="issue"
        v-for="issue in issues"
        v-bind:key="issue.id"
        v-bind:volume="$route.params.id"
        class="issue-card-import-single"
      />
    </div>
  </div>
</template>

<script>
// import SearchService from "@/services/SearchService.js";
import ComicCardImport from "@/components/ComicCardImport.vue";
export default {
  name: "issue-list",
  components: {
    ComicCardImport,
  },
  data() {
    return {
      issueName: "",
      issueId: "",
      issueNumber: "",
      issues: [],
    };
  },

  created: function () {
    const activeVolumeID = this.$route.params.id;
    this.$store.commit("SET_ACTIVE_VOLUME", activeVolumeID);
    let url =
      "http://comicvine.gamespot.com/api/issues/?api_key=2305a8c76071ed723085da1129ee957508678790&field_list=name,image,issue_number,deck,description,volume,id&format=json&filter=volume:" +
      activeVolumeID;
    fetch(url)
      .then((response) => {
        response.json().then((data) => {
          this.issues = data.results;
        });
      })
      .catch((err) => {
        console.log("Fetch Error", err);
      });

    // SearchService.searchIssuesByVolume(activeVolumeID)
    //   .then((response) => {
    //     this.issues = response.data.results;
    //   })
    //   .catch((error) => {
    //     handle an error
    //     console.log(error);
    //   });
  },
};
</script>

<style>
.issue-list-main {
  width: 90%;
  padding: 10px;
  margin: 0 auto;
  margin-top: 30px;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-around;
  background: #f8f59b;
  box-shadow: inset 0 -0.6em 0 -0.25em rgba(0, 0, 0, 0.17);
}
</style>
