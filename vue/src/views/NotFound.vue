<template>
  <div class = "not-found">
    <h1>(404)Page Not Found</h1>
      <!-- <img src="../assets/bg2.jpg" /> -->
   <div class = "text-box">
    The page you are trying to reach cannot be found!
   </div>
  </div>

 

</template>

<script>
export default {
name: 'not-found'
}
</script>

<style scoped>

.text-box{
     margin: 15vw;
    font-size: 40px;
     color: white;
}
  h1 {
    color: var(--border);
    font-size: 2em;
  }
.not-found{
    background-color: black;  
  color: orangered;
  text-shadow: 2px 2px black;
  text-align: center;
  /* background-image: url("../assets/bg2.jpg"); */
   
}
.not-found img{
   width: 50%;
  min-height: 175px;
  margin: 50px;
  padding: 40px;
  font-weight: bold;
  
}



</style>