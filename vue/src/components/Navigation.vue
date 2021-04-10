<template>
  <div id="nav-main">
    <div id="nav-not-logged" v-if="$store.state.token == ''">
      <router-link v-bind:to="{ name: 'home' }">HOME</router-link>
      <router-link v-bind:to="{ name: 'volume-search' }">SEARCH</router-link>
      <a href="#">ABOUT</a>
      <router-link :to="{ name: 'register' }">REGISTER</router-link>
    </div>
    <div id="nav-logged" v-if="$store.state.token != ''">
      <router-link v-bind:to="{ name: 'user-collections' }">MY COLLECTIONS</router-link>
      <router-link v-bind:to="{ name: 'volume-search' }">SEARCH</router-link>
      <a href="#">ABOUT</a>
      <router-link v-bind:to="{ name: 'logout' }">LOG OUT</router-link>
    </div>
  </div>
</template>

<script>
export default {
  name: "navigation",
  data() {
    return {
      loggedIn: this.$store.state.isLoggedIn,
    };
  },
};
</script>

<style>
#nav-main {
  margin: 0;
}

#nav-not-logged,
#nav-logged {
  min-height: 50px;
  width: 100%;
  height: 100%;
  display: flex;
  padding: 0;
  margin: 0;
  justify-content: space-around;
  align-items: center;
  background-color: #2E338C;
}

#nav-main a, #nav-main a:hover, #nav-main a:visited, #nav-main a:active {
  color: #fff;
  text-decoration: none;
  font-size: 20px;
  font-weight: bolder;
  font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

/* #nav-not-logged {
  background-color: #EB7862;
}
#nav-logged {
  background-color: #1C1953;
} */
</style>