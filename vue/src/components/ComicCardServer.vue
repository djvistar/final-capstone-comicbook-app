<template>
  <div>
    <img id="image" v-bind:src="issue.imageURL" />
    <div id="name">{{ issue.title }}</div>
    <div id="volume">Series: <br />{{ issue.volumeName }}</div>
    <div id="issue_number">Issue # {{ issue.issue_number }}</div>
  </div>
</template>

<script>
export default {
  name: "comic-card-server",
  props: {
    issue: Object,
  },
};
</script>

<style>
</style>