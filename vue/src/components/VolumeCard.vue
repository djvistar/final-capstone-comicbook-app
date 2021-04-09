<template>
  <div class="volume-card-main">
    <router-link v-bind:to="{ name: 'issue-list', params: { id: volume.id } }">
      <div class="single-volume-card">
        <div class="volume-card-info">
          <div id="vol-name">{{ volume.name }}</div>
          <img id= "image" v-bind:src="volume.image.small_url" />
          <div id= "issue-count"># of Issues: {{ volume.count_of_issues }}</div>
          <div id= "publisher">{{ volume.publisher.name }}</div>
        </div>
      </div></router-link
    >
  </div>
</template>

<script>
export default {
  name: "volume-card",
  components: {},
  props: {
    volume: Object,
  },
};
</script>

<style>
.volume-card-info img {
 max-height: 212px;
 max-width: 138px;
}
.volume-card-main {
 
}
.volume-card-info {
  padding: 2px 2px;
  display: grid;
  grid-template-rows: 15% 75% 5% 5%;
  grid-template-areas:
    "volume"
    "image"
    "pub"
    "count";
  justify-content: center;
  align-content: center;
}
.single-volume-card {
  width: 200px;
  min-width: auto;
  height: 307px;
  background-color: #00afef;
  color: rgb(0, 0, 0);
  border: solid 1px #777;
  display: flex;
  align-items: center;
  justify-content:center ;
  flex-flow: row wrap;

  /* height: 95%;
  width: 95%; */
  /* background-color: lightgray;
  border: solid 3px black; */
  /* display:grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-rows: 1fr 1fr 1fr 1fr;
  grid-template-areas:
  ". vol . "
  "image image image"
  ". count ."
  ". pub ."; */
}
/* .comic-card-main img {
  max-width: 120px;
  grid-area: image;
}
.comic-card-main {
  max-width: 240px;
  max-height: 240px;
  margin: 15px 0;
  padding: 10px;
  background-color: #00afef;
  color: rgb(0, 0, 0);
  border: solid 1px #777;
  display: flex;
  justify-items: center;
  align-content: flex-start;
}
.comic-card-info {
  padding: 2px 2px;
  display: grid;
  background-color: #b1ee0b;
  grid-template-columns: 1fr 1fr;
  grid-template-rows: 1fr 1fr 1fr 0.5fr;
  grid-template-areas:
    "image issue_number"
    "image name"
    "image name"
    "image volume";
} */
.volume-card a:hover,
.volume-card a:visited,
.volume-card a:link,
.volume-card a:active {
  color: #020202;
  text-decoration: none;
  margin: 10px;
}



#publisher {
  grid-area: pub;
  /* font-size: 075%; */
}
#vol-name {
  grid-area: volume;
  word-wrap: break-word;
  
}
#issue-count {
  grid-area: count;
}
#image {
  /* max-width: 138px;
  max-height: 213px;  */
  grid-area: image;
}
</style>
