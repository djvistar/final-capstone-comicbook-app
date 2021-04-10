<template>
  <div class="comic-card-server-main">
    <div class="comic-card-server-content">
      <img v-bind:src="issue.image" />

      <div>Series: {{ issue.volumeName }}</div>
      <div>Issue # {{ issue.number }}</div>
      <div class="issue-title">Issue Title: {{ issue.title }}</div>
      
    </div>
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
.comic-card-server-main {
  background-color: lightcoral;
  width: 200px;
  margin: 5px;
  padding: 25px;
  border-radius: 10px;
}

.comic-card-server-main img {
  width: 150px;
}
.comic-card-server-content {
  width: 100%;
  color: #000;
  font-size: 14px;
}
</style>