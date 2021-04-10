<template>
  <div id="app">
    <div class="site-wrap">
      <!-- <div id="nav">
      <router-link v-bind:to="{ name: 'home' }">Home</router-link>&nbsp;|&nbsp;
      <router-link
        v-bind:to="{ name: 'logout' }"
        v-if="$store.state.token != ''"
        >Logout</router-link
      >
    </div> -->
      <the-header class="header" />
      <router-view class="site-content" />
    </div>
    <the-footer class="footer" />
  </div>
</template>
<script>
import TheHeader from "./components/TheHeader.vue";
import TheFooter from "./components/TheFooter.vue";

export default {
  name: "App",
  components: {
    TheHeader,
    TheFooter,
  },
};
</script>

<style>
html,
body {
  margin: 0;
  padding: 0;
  min-height: 100vh;
  background-color: #ff165d;
}

#app {
  font-family: Avenir, Arial, Helvetica, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #000;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  margin: 0;
}

.site-wrap {
  flex: 1 0 auto;
  margin: 0;
  background-color: #fff;
}

.site-content {
  margin: 0;
  padding-bottom: 50px;
  padding-top: 20px;
}

.footer {
  /* position: fixed;
  bottom: 0;
  left: 0; */
  width: 100%;
  height: 75px;
  flex-shrink: 0;
}
/* ELEMENTS FOR ALL PAGES */
h1 {
  width: 50%;
  margin: 0 auto;
  padding: 15px;
  background-color: #3ec1d3;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
  border: 1px solid #000;
  color: #fff;
}

.button-block {
  display: inline-block;
  padding: 0.5em 0.8em;
  margin: 0 0.3em 0.3em 0;
  border-radius: 0.15em;
  box-sizing: border-box;
  text-decoration: none;
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  font-weight: bolder;
  border: 1px solid #000;
  color: #ffffff;
  text-align: center;
  position: relative;
  box-shadow: inset 0 -0.6em 0 -0.35em rgba(0, 0, 0, 0.17);
}

a.button-block:active {
  top: 0.1em;
}
</style>

