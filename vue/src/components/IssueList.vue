<template>
  <div class="issue-list">
<!--<comic-card v-for= "comic in volume" v-bind:comic="comic" />  -->
  <volume-details></volume-details>
  <comic-card></comic-card>
  
  </div>
</template>

<script>
//import VolumeDetails from "../components/VolumeDetails";
import ComicCard from "../components/ComicCard";
import VolumeDetails from './VolumeDetails.vue';
export default {
name: "issue-list",
computed:{
    comics(){
        return this.$store.state.VolumeDetails.filter((comic) =>{
            return comic.VolumeDetails.id == id; //garbage code- needs rework to correct variable, placeholder
        })
    }
},
data(){
    
    //check api for issue search params
return;
},
components:{
    ComicCard,
   // VolumeDetails
}
}
</script>

<style>
.vo
VolumeDetailslume-card-main img {
  width: 150px;
}
.volume-card-main {
  display: flex;
  background-color: lightgray;
}
</style>