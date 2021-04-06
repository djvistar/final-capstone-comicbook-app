<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
    <div class = "links">
<router-link :to="{ name: 'volume-search'}">
  <button id="search">   search volumes  </button></router-link>
    </div>
  </div>
  
</template>

<script>
export default {
  name: "home"
};
</script>
