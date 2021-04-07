<template>
  <div id="nav-main">
    <div id="nav-not-logged" v-if="$store.state.token == ''">
      <router-link v-bind:to="{ name: 'home' }">HOME</router-link>
      <router-link v-bind:to="{ name: 'volume-search' }">SEARCH</router-link>
      <a href="#">ABOUT</a>
      <router-link :to="{ name: 'register' }">REGISTER</router-link>
    </div>
    <div id="nav-logged" v-if="$store.state.token != ''">
      <a href="#">MY DASHBOARD</a>
      <router-link v-bind:to="{ name: 'volume-search' }">SEARCH</router-link>
      <a href="#">ABOUT</a>
      <router-link :to="{ name: 'logout' }">LOG OUT</router-link>
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
#nav-not-logged,
#nav-logged {
  min-height: 50px;
  width: 100%;
  display: flex;
  padding: 0;
  justify-content: space-around;
  align-items: center;
}
#nav-not-logged {
  background-color: #00cbff;
}
#nav-logged {
  background-color: lightcoral;
}
</style>