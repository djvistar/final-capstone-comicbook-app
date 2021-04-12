<template>
  <div class="comic-search-main">
    <h1>SEARCH</h1>
    <div id="searchVolumes">
      <div class="vol-search-form-box">
        <form v-on:submit.prevent="searchVolumes" class="searchForm">
          <label for="name"><strong>Series Name</strong>:</label>
          <input type="text" name="name" v-model="volumeName" />
          <br />
          <div id="publisher-form" v-if="volumeName != ''">
          <label for="publisher"><strong>Publisher</strong> (Optional): </label>
          <input type="text" name="publisher" v-model="volumePublisher" />
          </div>
          <br />
          <button class="button-block search-btn">Submit</button>
        </form>
      </div>
      <div class="volume-results">
        <volume-card
          v-bind:volume="volume"
          v-for="volume in volumes"
          v-bind:key="volume.id"
          class="volume-card-single"
        />
      </div>
    </div>
  </div>
</template>

<script>
import VolumeCard from "@/components/VolumeCard.vue";
import SearchService from "@/services/SearchService.js";

export default {
  name: "volume-search",
  components: {
    VolumeCard,
  },
  data() {
    return {
      volumeName: "",
      volumePublisher: "",
      volumeYearStart: "",
      volumes: [],
    };
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
    },
  },
};
</script>

<style>
.volume-results {
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  width: 90%;
  margin: 10px auto;
  background: #FF9A00;
  /* flex: 0 0 25; */
}
.vol-search-form-box {
  margin: 30px auto;
  padding: 20px 40px;
  background-color: #f8f59b;
  text-align: center;
  width: 50%;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
  font-size: 18px;
}
input[type=text] {
  padding: 5px 10px;
  margin: 8px 10px;
  width: 35%;
  box-sizing: border-box;
}
.search-btn {
  background-color: #ff165d;
}
.search-btn:active {
  top: .2em;
}
.comic-search-main {
  padding-bottom: 15px;
}

.volume-card-single{
  margin: 25px;
}

.searchForm {
  padding: 10px;
}

</style>