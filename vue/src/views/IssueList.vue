<template>
  <div class="issue-list-main">
    RESULTS
    <br />

    <comic-card
      v-bind:issue="issue"
      v-for="issue in issues"
      v-bind:key="issue.id"
    />
  </div>
</template>

<script>
import SearchService from "@/services/SearchService.js";
import ComicCard from "@/components/ComicCard.vue";
export default {
  name: "issue-list",
  components: {
    ComicCard,
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
</style>
