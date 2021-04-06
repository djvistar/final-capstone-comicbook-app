<template>
  <div class="header-main">
    <div class="header-image-box">
      <img src="../assets/app-logo-temp-300-150.png" />
      <div id="login-box">LOG IN / REGISTER</div>
    </div>
    <navigation />
  </div>
</template>

<script>
import Navigation from "@/components/Navigation.vue";
export default {
  name: "the-header",
  data() {
    return {};
  },
  components: {
    Navigation,
  },
};
</script>

<style>
.header-main {
  width: 100%;
  min-height: 50px;
  margin: 0;
  padding: 0;
}
.header-image-box {
  width: 100%;
  min-height: 175px;
  margin: 0;
  padding: 0;
  font-weight: bold;
  display: flex;
  align-items: center;
  justify-content: space-between;
}

#login-box {
  width: 150px;
  height: 75px;
  margin: 20px;
  padding: 10px;
  background-color: lightgray;
}
.header-main img {
  margin: 20px;
}
</style>