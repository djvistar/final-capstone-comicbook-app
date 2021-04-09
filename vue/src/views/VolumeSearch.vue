<template>
  <div>
    
      <div class="comic-search-main">
    SEARCH
    <br />
    <div id="searchVolumes">
      <form v-on:submit.prevent="searchVolumes" class="searchForm">
        <label for="name">Series Name:</label>
        <input type="text" name="name" v-model="volumeName" />
        <br />
        <label for="publisher">Publisher:</label>
        <input type="text" name="publisher" v-model="volumePublisher" />
        <br />
        <button class="btn btn-submit">Submit</button>
      </form>
      <div class= "volume-results">
      <volume-card
        v-bind:volume="volume"
        v-for="volume in volumes"
        v-bind:key="volume.id"
      />
      </div>
    </div>
  </div>
  </div>
</template>

<script>
import VolumeCard from "@/components/VolumeCard.vue"
import SearchService from "@/services/SearchService.js"

export default {
    name:"volume-search",
components:{
VolumeCard
},
data(){
    return{
        volumeName: "",
      volumePublisher: "",
      volumeYearStart: "",
      volumes: [],

    }
},

methods: {
    // search by Volume:
searchVolumes() {
      SearchService.searchVolumes(
        this.volumeName,
        this.volumePublisher,
        this.volumeYearStart
      )
        .then((response) => {
          this.volumes = response.data.results;
          if (this.volumePublisher != "") {
            this.volumes = this.volumes.filter((volume) => {
              if (volume.publisher != null) {
                return volume.publisher.name.includes(this.volumePublisher);
              }
            });
          }
          this.volumes.sort(function (a, b) {
            return b.count_of_issues - a.count_of_issues;
          });
          this.$store.state.volumeResults = this.volumes;
        })
        .catch((error) => {
          // handle an error
          console.log(error);
        });
    }

}
}
</script>

<style>
  .volume-results{

  display:flex;
  flex-flow: row wrap;
  justify-content: space-evenly;
  margin-left: 5%;
  margin-right:5%;
  /* flex: 0 0 25; */
  }
.comic-search-main{
  padding: 15px;
}
  .volume-results{

  /* display:flex;
  flex-basis: auto;
  flex-flow: row wrap;
  justify-content: space-evenly;
  align-content: space-around; */
}
.searchForm{
  padding:10px;
}
</style>