<template>
  <div class="volume-card-main">
    <router-link v-bind:to="{name: 'issue-list', params: {id: volume.id}}">
      <div class="single-volume-card">
    <img v-bind:src="volume.image.small_url" />
    <div class="card-info">
      <h3>{{ volume.name }}</h3>
      <p># of Issues: {{ volume.count_of_issues }}</p>
      <p>{{volume.publisher.name}}</p>
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
}
.volume-card-main {
  display: flex;
  background-color: lightgray;
}
.single-card{
  display: block;
}
</style>
