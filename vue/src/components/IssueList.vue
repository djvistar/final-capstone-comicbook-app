<template>
  <div class="issue-list">
<!--<comic-card v-for= "comic in volume" v-bind:comic="comic" />  -->
  <volume-card></volume-card>
  <comic-card-api></comic-card-api>
  
  </div>
</template>

<script>
import VolumeCard from "../components/VolumeCard";
import ComicCardAPI from "../components/ComicCardAPI";

export default {
name: "issue-list",
// computed:{
//     comics(){
//         return this.$store.state.VolumeDetails.filter((comic) =>{
//             return comic.VolumeDetails.volume.id ; //garbage code- needs rework to correct variable, placeholder
//         })
//     }
//},
data(){
    
    //check api for issue search params
return;
},
components:{
    ComicCardAPI,
    VolumeCard
}
}
</script>

<style>
.vo
.volume-card-main img {
  width: 150px;
}
.volume-card-main {
  display: flex;
  background-color: lightgray;
}
</style>