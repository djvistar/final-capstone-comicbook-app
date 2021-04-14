<template>
  <div class="header-main">
    <div class="header-image-box">
      <img src="../assets/LongBoxLogo.png" />
      <div id="login-box">
        <div id="not-logged" v-if="$store.state.token == ''">
          <router-link
            v-bind:to="{ name: 'login' }"
            class="button-block not-logged-btn"
            >LOG IN</router-link
          >
          <!-- <router-link v-bind:to="{ name: 'login' }" class="login-button">REGISTER</router-link> -->
        </div>
        <div class="button-block logged-in-btn" v-if="$store.state.token != ''">
          Greetings, {{$store.state.user.username}}!
        </div>
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
  background-color: #f6f7d7;
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
  color: #fff;
  font-size: 20px;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

.logged-in-btn {
  background-color: #ff165d;
}
.not-logged-btn {
  background-color: #2b80d3;
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
  height: 150px;
  width: auto;
}
</style>