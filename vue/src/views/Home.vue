<template>
 <div class="home">
    <h1> Welcome To The Comic Book Collection</h1>
    <div class ="main">
    <div class = "image-card">
    <img src = "../assets/spiderman.jpg"/>
     <img src = "../assets/xmen.jpg"/>
     <img src = "../assets/wolverine.jpg"/>
    <!-- <p>You must be authenticated to see this</p> -->
    </div>
    <p> Content Goes Here</p>
      </div>
    <div class="links"></div>
  </div>
</template>

<script>
export default {
  name: "home",
};
</script>

<style  >

  .img-card{
  
  margin: 3px; 
  padding: 5px; 
   
  }
  img{
   
width: 18%;
height: auto;
margin: 10px;
padding: 20px;
  }
  
.home {
display: flexbox;
background-color: rgba(89, 162, 247, 0.938);
   color: white;
   text-shadow: 2px 2px black;
   text-align: center;
   margin:0;
   
 }
  h1{
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
   margin-top:1%;
   font-size: 40px;
 }
 .main{
  
 }
 

</style>
