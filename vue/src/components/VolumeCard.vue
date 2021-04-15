<template>
  <div class="volume-card-main">
    <!-- <router-link v-bind:to="{ name: 'issue-list', params: { id: volume.id } }"> -->
    <div class="volume-card-box">
      <div class="volume-card-img">
        <img v-bind:src="volume.image.small_url" />
      </div>
      <div class="volume-card-content-box">
        <div class="volume-card-content">
          <router-link
            v-bind:to="{ name: 'issue-list', params: { id: volume.id } }"
            
          >
            <span class="router-click"></span
          ></router-link>
          <div class="overflow-text"><strong>{{ volume.name }}</strong></div>
          
          <em>{{ volume.count_of_issues }}</em> Issues
          <br />
          <em>{{ volume.publisher.name }}</em>
        </div>
      </div>
    </div>
    <!-- </router-link> -->
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
.router-click {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;

  z-index: 1;
}
.volume-card-main {
  margin: 20px;
  padding: 0;
  position: relative;
}
.volume-card-box {
  width: 200px;
  height: 350px;
  background-color: #ff9a00;
  margin: 0;
  padding: 0;
  border: 5px solid #fff;
  box-shadow: 4px 4px 2px 0px rgba(0, 0, 0, 0.6);
  background-color: #f8f59b;
}
.volume-card-img {
  width: 100%;
  height: 65%;
  border-bottom: 5px solid #fff;
  background-color: #000;
}
.volume-card-img img {
  object-fit: contain;
  width: 100%;
  height: 100%;
  object-position: 50% 50%;
}

.volume-card-content-box {
  width: 100%;
  height: 33%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  margin: 0;
  padding: 0;
}
.volume-card-content {
  color: #000;
  font-size: 16px;
  margin: 0;
  padding: 5px;

  height: 100%;
}

.volume-card-content,
.volume-card-content a,
.volume-card-content a:hover,
.volume-card-content a:visited,
.volume-card-content a:active {
  text-decoration: none;
  font-size: 16px;
}

.overflow-text {
  overflow: hidden;
  text-overflow: ellipsis;
  display: -webkit-box;
  -webkit-line-clamp: 2; /* number of lines to show */
  -webkit-box-orient: vertical;
  
}
/* .volume-card-info {
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

#vol-name {
  grid-area: volume;
  word-wrap: break-word;
}
#issue-count {
  grid-area: count;
}
#image {
  max-width: 138px;
  max-height: 213px; 
  grid-area: image;
} */
</style>
