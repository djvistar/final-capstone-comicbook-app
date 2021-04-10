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
}

h1 {
  background-color: lightskyblue;
  margin-top: 10px;
}

#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}

.site-content {
  margin: 0;
  padding-bottom: 50px;
}

.footer {
  /* position: fixed;
  bottom: 0;
  left: 0; */
  width: 100%;
  height: 75px;
  flex-shrink: 0;
}
</style>

