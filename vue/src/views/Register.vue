<template>
  <div id="register" class="text-center">
    <h1 class="h3 mb-3 font-weight-normal">Create Account</h1>
    <div class="register-content">
    <form class="form-register" @submit.prevent="register">
      
      <div class="alert alert-danger" role="alert" v-if="registrationErrors">
        {{ registrationErrorMsg }}
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
      <label for="confirmPassword" class="sr-only">Confirm Password: </label>
      <input
        type="password"
        id="confirmPassword"
        class="form-control"
        placeholder="Confirm Password"
        v-model="user.confirmPassword"
        required
      />
      <br />
      <!-- <router-link :to="{ name: 'login' }">Have an account?</router-link> -->
      <button class="button-block register-btn" type="submit">
        Create Account
      </button>
    </form>
    </div>
  </div>
</template>

<script>
import authService from '../services/AuthService';

export default {
  name: 'register',
  data() {
    return {
      user: {
        username: '',
        password: '',
        confirmPassword: '',
        role: 'user',
      },
      registrationErrors: false,
      registrationErrorMsg: 'There were problems registering this user.',
    };
  },
  methods: {
    register() {
      if (this.user.password != this.user.confirmPassword) {
        this.registrationErrors = true;
        this.registrationErrorMsg = 'Password & Confirm Password do not match.';
      } else {
        authService
          .register(this.user)
          .then((response) => {
            if (response.status == 201) {
              this.$router.push({
                path: '/login',
                query: { registration: 'success' },
              });
            }
          })
          .catch((error) => {
            const response = error.response;
            this.registrationErrors = true;
            if (response.status === 400) {
              this.registrationErrorMsg = 'Bad Request: Validation Errors';
            }
          });
      }
    },
    clearErrors() {
      this.registrationErrors = false;
      this.registrationErrorMsg = 'There were problems registering this user.';
    },
  },
};
</script>

<style>
.register-content {
  margin: 30px auto;
  padding: 20px 40px;
  background-color: #f8f59b;
  text-align: center;
  width: 50%;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
}

.register-content input[type="text"], .register-content input[type="password"] {
  padding: 5px 10px;
  margin: 8px 10px;
  width: 35%;
  box-sizing: border-box;
}

.register-btn {
  background-color: #ff165d;
  margin-top: 10px;
}
/* .register-btn:active {
  top: 0.2em;
} */
</style>