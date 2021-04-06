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
      <volume-details
        v-bind:volume="volume"
        v-for="volume in volumes"
        v-bind:key="volume.id"
      />
    </div>
  </div>
  </div>
</template>

<script>
import VolumeDetails from "@/components/VolumeDetails.vue"
import SearchService from "@/services/SearchService.js"

export default {
    name:"volume-search",
components:{
VolumeDetails
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

</style>