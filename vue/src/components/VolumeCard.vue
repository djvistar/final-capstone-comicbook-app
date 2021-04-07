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
  width: 150px;
  height: 300px;
}
.volume-card-main {
  width: 150px;
  display: flex;
  background-color: lightgray;
}
.single-card{
  display: block;
}
.card-info{
  
  
}
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
