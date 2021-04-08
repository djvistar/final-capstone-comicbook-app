<template>
  <div class="volume-card-main">
    <router-link v-bind:to="{name: 'issue-list', params: {id: volume.id}}">
      <div class="single-volume-card">
    
    <div class="card-info">
      <h3 id=vol-name>{{ volume.name }}</h3>
      <img id="image" v-bind:src="volume.image.small_url" />
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
  width: 138px;
  height: 213px;
}
.volume-card-main {
flex: 10 calc(20% - 10px);
height: 375px;


}
.single-volume-card{
  align-content: center;
  justify-content: center;
  height: 90%;
  width: 90%;
  background-color: lightgray;
  border: solid 3px black;
  

}
.volume-card a:hover, a:visited, a:link, a:active{
  
  color: #020202;
  text-decoration: none;
  margin: 10px;
  
}

.volume-card{


}

#publisher{
  grid-area: pub;
  font-size: .5vw;
}
#vol-name{
  grid-area: volume;
  word-wrap: break-word;
  font-size: 24px;
  font-size:1.25em;
  
}
#issue-count{
  grid-area: count;
}
#image{
  grid-area: image;
}
</style>
