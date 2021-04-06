<template>
  <div>
    <div class="comic-search-main">
      <br />
      <div id="issues-list">
        <issue-list
          v-bind:issue="issue"
          v-for="issue in volumes"
          v-bind:key="issue.id"
        />
        <volume-details></volume-details>
        <comic-card></comic-card>
      </div>
    </div>
  </div>
</template>

<script>
import VolumeDetails from "@/components/VolumeDetails.vue"
import SearchService from "@/services/SearchService.js"
import ComicCard from "@/components/ComicCard.vue"
export default {
    name:"issue-list",
components:{
ComicCard,
VolumeDetails
},
data(){
    return{
      issueName: "",
      issueId: "",
      issueNumber: "",
      issues: [],

    }
},
methods: {
    issueByVolume(){
        SearchService.searchIssuesByVolume(
            this.volumeID
        )
        .then((response)=>{
            this.issues=response.data.results;

        })
     //need catch   .catch((error) => {
          // handle an error
        //  console.log(error);
    //}
  }
}
}
</script>

<style>
</style>
