<template>
  <div class="home-images-slides-main">
    <!-- <VueSlickCarousel v-bind="setting">
      <div>HI</div>
      <div>2</div>
      <div>3</div>
      <div>4</div>
    </VueSlickCarousel> -->
  </div>
</template>

<script>
// import VueSlickCarousel from "vue-slick-carousel";

export default {
  name: "home-image-slides",
//   components: { VueSlickCarousel },
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