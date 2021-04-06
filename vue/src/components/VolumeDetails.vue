<template>
  <div class="volume-card-main">
    <img v-on:click.prevent="searchIssuesByVolume" v-bind:src="volume.image.small_url" />
    <div class="card-info">
      <h3>{{ volume.name }}</h3>
      <p># of Issues: {{ volume.count_of_issues }}</p>
      <p>{{volume.publisher.name}}</p>
    </div>
  </div>
</template>

<script>
export default {
name: 'volume-details',
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
</style>
