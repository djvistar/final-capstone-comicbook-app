<template>
  <div class="header-main">
    <div class="header-image-box">
      <img src="../assets/app-logo-temp-300-150.png" />
      <div id="login-box">
        <div id="not-logged" v-if="$store.state.token == ''">
          <router-link v-bind:to="{ name: 'login' }" class="login-button">LOG IN</router-link>
          <!-- <router-link v-bind:to="{ name: 'login' }" class="login-button">REGISTER</router-link> -->
        </div>
        <div id="logged" v-if="$store.state.token != ''">Greetings, User!</div>
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
  methods: {
    goToLogin() {
      this.$router.push("login");
    },
    goToRegister() {
      this.$router.push("register");
    },
  },
};
</script>

<style>
.header-main {
  width: 100%;
  min-height: 50px;
  margin: 0;
  padding: 0;
  background-color: #F6F7D7;
  background-image: url("../assets/SL-090119-22970-03.jpg");
  background-repeat: no-repeat;
  background-size: 2000px auto;
  background-position: center;
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
  height: 75px;
  margin: 20px 50px 20px 20px;
  padding: 20px;
  display: flex;
  justify-content: center;
  align-items: center;
  /* background-color: #05c7f2;
  border-radius: 10px; */
  color: #fff;
  font-size: 20px;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

#login-box a,
#login-box a:hover,
#login-box a:visited,
#login-box a:active {
  text-decoration: none;
  color: #fff;
}
.header-main img {
  margin: 20px;
}

a.login-button {
  display: inline-block;
  padding: 0.5em .8em;
  margin: 0 0.3em 0.3em 0;
  border-radius: 0.15em;
  box-sizing: border-box;
  text-decoration: none;
  font-family: "Roboto", sans-serif;
  text-transform: uppercase;
  font-weight: bolder;
  color: #ffffff;
  background-color: #2B80D3;
  box-shadow: inset 0 -0.6em 0 -0.35em rgba(0, 0, 0, 0.17);
  text-align: center;
  position: relative;
}
a.login-button:active {
  top: 0.1em;
}

#logged {
  display: inline-block;
  padding: 0.5em .8em;
  margin: 0 0.3em 0.3em 0;
  border-radius: 0.15em;
  box-sizing: border-box;
  text-decoration: none;
  font-family: "Roboto", sans-serif;
  font-weight: bolder;
  color: #fff;
  background-color: #FF165D;
  box-shadow: inset 0 -0.6em 0 -0.35em rgba(0, 0, 0, 0.15);
  text-align: center;
  position: relative;
}
</style>