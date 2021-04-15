<template>
  <div class="home-images-slides-main">
    <div class="image-bar">
      <img src="../assets/covers/comic-cover_12.jpg" />
      <img src="../assets/covers/comic-cover_10.jpg" />
      <img src="../assets/covers/comic-cover_08.jpg" />
      <img src="../assets/covers/comic-cover_06.jpg" />
      <img src="../assets/covers/comic-cover_01.jpg" />
      <img src="../assets/covers/comic-cover_03.jpg" />
      <img src="../assets/covers/comic-cover_05.jpg" />
      <img src="../assets/covers/comic-cover_15.jpg" />
      <img src="../assets/covers/comic-cover_18.jpg" />
      <img src="../assets/covers/comic-cover_17.jpg" />
    </div>
  </div>
</template>

<script>
export default {
  name: "home-image-bar",
  data() {
    return {};
  },
};
</script>

<style>
.image-bar {
}
.home-images-slides-main {
  width: 100%;
  padding: 0;
  margin: 0 0 -50px 0;
}
.image-bar {
  width: 100%;
  height: 180px;
  background-color: #000;
  padding: 0;
  margin: 0;
  display: flex;
  justify-content: space-around;
  align-items: center;
  overflow: hidden;
}
.image-bar img {
  height: 150px;
  width: auto;
  /* box-shadow: 3px 3px 1px 0px rgba(0, 0, 0, 0.5); */
}
</style>