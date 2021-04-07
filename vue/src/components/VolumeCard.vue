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
  width: 138px;
  height: 213px;
}
.volume-card-main {
  width: 150px;
  height: 375px;
  display: flex;
  align-content: center;
  justify-content: center;
  background-color: lightgray;
  padding:2px;
  border: solid 3px black;

}
.single-volume-card{

  padding: 10px;
}
.volume-card a:hover, a:visited, a:link, a:active{
  
  color: #020202;
  text-decoration: none;
  margin: 10px;
}

/* .volume-card{
  display:grid;
  grid-template-rows: 1fr 1fr 1fr 1fr 1fr 1fr;
  grid-template-areas:
  "image"
  "image"
  "image"
  "pub"
  "count"
  "volume";
} */

#publisher{
  grid-area: pub;
  font-size: .5vw;
}
#vol-name{
  grid-area: volume;
  word-wrap: break-word;
  font-size: .9vw;
}
#issue-count{
  grid-area: count;
  font-size: .75vw;
}
#image{
  grid-area: image;
}
</style>
