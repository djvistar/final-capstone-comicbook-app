<template>
  <div>
    <h1>SEARCH RESULTS</h1>

    
    <div class="issues-volume-name">{{issues[0].volume.name}}</div>
    <div class="register-message" v-if="$store.state.token == ''">
      <p>( Want to add these to your own Collection? <router-link :to="{ name: 'register' }">Register now! )</router-link></p>
    </div>
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
      volumeName: "",
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
.register-message {
  margin: 0 auto;
  padding: 5px 10px;
  text-align: center;
  width: 90%;
  background-color: #2B80D3;
  /* box-shadow: inset 0 -0.6em 0 -0.25em rgba(0, 0, 0, 0.17); */
  font-size: 20px;
  color: #fff;
  font-weight: bold;
  
}

.register-message p {
  margin: 5px;
}

.issues-volume-name {
  margin: 0 auto;
  margin-top: 30px;
  padding: 10px;
  display: flex;
  flex-direction: column;
  justify-content: center;
  width: 90%;
  background: #ff165d;
  font-size: 34px;
  color: #fff;
  font-weight: bold;
  

}
.issue-list-main {
  width: 90%;
  padding: 10px;
  margin: 0 auto;
  display: flex;
  flex-wrap: wrap;
  align-items: center;
  justify-content: space-around;
  background: #f8f59b;
  box-shadow: inset 0 -0.6em 0 -0.25em rgba(0, 0, 0, 0.17);
}
</style>
