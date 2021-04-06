<template>
  <div id="nav-main">
    <a href="#">LINK 1</a>
      <a href="#">LINK 1</a>
    <a href="#">LINK 1</a>
    <a href="#">LINK 1</a>
  </div>
</template>

<script>
export default {
    name: 'navigation',
};
</script>

<style>
#nav-main {
    background-color: #00cbff;
    min-height: 50px;
    width: 100%;
    display: flex;
    padding: 0;
    justify-content:space-around;
    align-items: center;
}
</style>