<template>
  <div class = "not-found">
    <h1>Not Found!</h1>
   <div class = "text-box">
    The page that you are trying to reach cannot be found!
   </div>
  </div>

</template>

<script>
export default {
name: 'not-found'
}
</script>

<style>

.text-box{
     margin: 15vw;
    font-size: 40px;
}
  h1 {
    color: var(--border);
    font-size: 2em;
  }

</style>