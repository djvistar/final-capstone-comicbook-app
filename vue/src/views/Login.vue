<template>
  <div id="login" class="text-center">
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Please Sign In</h1>
      <div class="login-content">
        <div class="alert alert-danger" role="alert" v-if="invalidCredentials">
          Invalid username and password!
        </div>
        <div
          class="alert alert-success"
          role="alert"
          v-if="this.$route.query.registration"
        >
          Thank you for registering, please sign in.
        </div>
        <label for="username" class="sr-only">Username: </label>
        <input
          type="text"
          id="username"
          class="form-control"
          placeholder="Username"
          v-model="user.username"
          required
          autofocus
        />
        <br />
        <label for="password" class="sr-only">Password: </label>
        <input
          type="password"
          id="password"
          class="form-control"
          placeholder="Password"
          v-model="user.password"
          required
        />
        <br />
        <!-- <router-link :to="{ name: 'register' }">Need an account?</router-link> -->
        <button type="submit" class="login-btn button-block">Sign in</button>
      </div>
    </form>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: "",
      },
      invalidCredentials: false,
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then((response) => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/");
          }
        })
        .catch((error) => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    },
  },
};
</script>
<style scoped>
.login-content {
  margin: 30px auto;
  padding: 20px 40px;
  background-color: #f8f59b;
  text-align: center;
  width: 50%;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
}

.login-content input[type="text"], .login-content input[type="password"] {
  padding: 5px 10px;
  margin: 8px 10px;
  width: 35%;
  box-sizing: border-box;
}

.login-btn {
  background-color: #ff165d;
  margin-top: 10px;
}
.login-btn:active {
  top: 0.2em;
}
</style>