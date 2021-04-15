<template>
  <div class="home-images-slides-main">

  </div>
</template>

<script>


export default {
  name: "home-image-bar",
  data() {
    return {
      settings: {
        arrows: false,
        dots: true,
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        autoplay: true,
        speed: 2000,
        autoplaySpeed: 2000,
        cssEase: "linear",
      },
    };
  },
};
</script>

<style>
</style>