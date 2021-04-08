<template>
  <div>
    <h2>RESULTS</h2>

    <div class="issue-list-main">
      <comic-card-api
        v-bind:issue="issue"
        v-for="issue in issues"
        v-bind:key="issue.id"
      />
    </div>
  </div>
</template>

<script>
import SearchService from "@/services/SearchService.js";
import ComicCardAPI from "@/components/ComicCardAPI.vue";
export default {
  name: "issue-list",
  components: {
    ComicCardAPI,
  },
  data() {
    return {
      issueName: "",
      issueId: "",
      issueNumber: "",
      issues: [],
    };
  },
  computed: {
    volume() {
      return this.$store.state.volumeResults.find(
        (volume) => volume.id == this.$store.state.activeVolume
      );
    },
  },
  created() {
    const activeVolumeID = this.$route.params.id;
    this.$store.commit("SET_ACTIVE_VOLUME", activeVolumeID);
    SearchService.searchIssuesByVolume(this.volume.id)
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
</style>
