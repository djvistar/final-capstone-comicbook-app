<template>
  <div class="volume-card-main">
    <router-link v-bind:to="{name: 'issue-list', params: {id: volume.id}}">
      <div class="single-volume-card">
    
    <div class="card-info">
      <img id="image" v-bind:src="volume.image.small_url" />
      <h3 id=vol-name>{{ volume.name }}</h3>
      <p id="issue-count"># of Issues: {{ volume.count_of_issues }}</p>
      <p id="publisher">{{volume.publisher.name}}</p>
    </div>
      </div></router-link>
  </div>
</template>

<script>

export default {
name: 'volume-card',
components:{

},
props: {
    volume: Object,
  },
};



</script>

<style>
.volume-card-main img {
<<<<<<< HEAD
  width: 150px;
  height: 300px;
}
.volume-card-main {
  width: 150px;
  display: flex;
  background-color: lightgray;
=======
  width: 138px;
  height: 213px;
}
.volume-card-main {
  width: 150px;
  height: 350px;
  display: flex;
  align-content: center;
  justify-content: center;
  background-color: lightgray;
  padding:2px;
  border: solid 3px black;

>>>>>>> 36390e71383dc8cb94ef5c6751a26901cebde7c4
}
.single-card{
  display: block;
}
<<<<<<< HEAD
.card-info{
  
  
}
=======

>>>>>>> 36390e71383dc8cb94ef5c6751a26901cebde7c4
#publisher{
  grid-area: pub;
  font-size: 1vw;
}
#vol-name{
  grid-area: volume;
  word-wrap: break-word;
  font-size: 1vw;
}
#issue-count{
  grid-area: count;
  font-size: 1vw;
}
#image{
  grid-area: image;
}
</style>
