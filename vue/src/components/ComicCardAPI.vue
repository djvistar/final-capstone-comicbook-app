<template>
  <div class="comic-card-main">
    <div class="comic-card-info">
      <img id="image" v-bind:src="issue.image.small_url" />
      <div id="name">{{ issue.name }}</div>
      <div id="volume">Series: <br />{{ issue.volume.name }}</div>
      <div id="issue_number">Issue # {{ issue.issue_number }}</div>
    </div>
  </div>
</template>

<script>
export default {
  name: "comic-card-api",
  props: {
    issue: Object,
  },
};
</script>

<style>
.comic-card-main img {
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
}

#name {
  grid-area: name;
  text-shadow: 1px 1px 0 #444;
  word-wrap: break-word;
  font-size: 1vw;
}

#issue_number {
  grid-area: issue_number;
  font-size: 1vw, larger;
}
#volume {
  grid-area: volume;
  font-size: 1vw;
  word-wrap: break-word;
}
#summary {
  grid-area: summary;
}
</style>