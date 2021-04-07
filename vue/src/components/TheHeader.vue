<template>
  <div class="header-main">
    <div class="header-image-box">
      <img src="../assets/app-logo-temp-300-150.png" />
      <div id="login-box">
        <div id="not-logged" v-if="$store.state.token == ''">
          <router-link v-bind:to="{ name: 'login' }">LOG IN</router-link>
          / <router-link :to="{ name: 'register' }">REGISTER</router-link>
        </div>
        <div id="logged" v-if="$store.state.token != ''">Hi, User!</div>
      </div>
    </div>
    <navigation />
  </div>
</template>

<script>
import Navigation from "@/components/Navigation.vue";

export default {
  name: "the-header",
  
  
  
  data() {
    return {
      loggedIn: this.$store.state.isLoggedIn,
      
    };
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
  padding: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  background-color: lightgray;
  border-radius: 10px;
}
.header-main img {
  margin: 20px;
}
</style>