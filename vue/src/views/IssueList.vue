<template>
  <div>
    <h1>SEARCH RESULTS</h1>

    <div class="issue-list-main">
      <comic-card-import
        v-bind:issue="issue"
        v-for="issue in issues"
        v-bind:key="issue.id"
        class="issue-card-server-single"
      />
    </div>
  </div>
</template>

<script>
import SearchService from "@/services/SearchService.js";
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
  // computed: {
  //   volume() {
  //     return this.$store.state.volumeResults.find(
  //       (volume) => volume.id == this.$store.state.activeVolume
  //     );
  //   },
  // },
  created: function () {
    const activeVolumeID = this.$route.params.id;
    this.$store.commit("SET_ACTIVE_VOLUME", activeVolumeID);
    SearchService.searchIssuesByVolume(activeVolumeID)
      .then((response) => {
        this.issues = response.data.results;
      })
      .catch((error) => {
        // handle an error
        console.log(error);
      });
  },

  //methods: {
  // issueByVolume(){
  //     SearchService.searchIssuesByVolume(
  //         this.volumeID
  //     )
  //     .then((response)=>{
  //         this.issues=response.data.results;
  // })
  //need catch   .catch((error) => {
  // handle an error
  //  console.log(error);
  //}
};
</script>

<style>
.issue-list-main {
  display: flex;
  flex-basis: auto;
  flex-flow: row wrap;
  justify-content: space-evenly;
  align-content: space-around;
}
.issue-card-server-single {
  margin: 25px;
}
</style>
