<template>
  <div class="comic-card-server-main">
    <div class="comic-card-server-box">
      <div class="comic-card-server-img">
        <img v-bind:src="issue.image" />
      </div>

      <div class="comic-card-server-content-box">
        <div class="comic-card-server-content">
          <strong>{{ issue.volumeName }}</strong>
          <br />
          <em>Issue # {{ issue.issueNumber }}</em>
        </div>
      </div>
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
  width: 200px;
  height: 300px;
  background-color: #3ec1d3;
  border: 5px solid #fff;
  box-shadow: 4px 4px 2px 0px rgba(0, 0, 0, 0.6);
  margin: 0;
  padding: 0;
}
.comic-card-server-box {
  width: 100%;
  height: 100%;
  background-color: #FF9A00;
  margin: 0;
  padding: 0;
}
.comic-card-server-img {
  width: 100%;
  height: 70%;
  border-bottom: 5px solid #fff;
  
}
.comic-card-server-content-box {
  width: 100%;
  height: 29%;
  display: flex ;
  flex-direction: column;
  justify-content: center;
  margin: 0;
  padding: 0;
}
.comic-card-server-content {
  color: #000;
  font-size: 16px;
  margin: 0;
  padding: 0;
}
.comic-card-server-img img {
  object-fit: cover;
  width: 100%;
  height: 100%;
  object-position: 100% 50%;
}
</style>