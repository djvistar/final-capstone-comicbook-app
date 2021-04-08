<template>
  <div class="dashboard-main">
    <h1>USER DASHBOARD</h1>
    <p><router-link v-bind:to="{ name: 'user-collections' }">MY COLLECTIONS</router-link></p>
  </div>
</template>

<script>
export default {
    name: "dashboard",
};
</script>

<style>
</style>