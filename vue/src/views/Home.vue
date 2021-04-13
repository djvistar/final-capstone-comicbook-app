<template>
 <div class="home">
    <h1> Welcome To LongBox Comics</h1>
    <div class ="main">
      <div class = "content-box">
        <p>Meet LongBox, your digital comic collection management system! Want to display your comics, but you're worried about wrinkling the cover while removing them from their hermetically sealed boxes in the climate controlled comic storage facility you rented at Xavier’s School for Gifted Youngsters to protect all of your precious issues?</p>
        <p class = "action">BAM!</p><p> We’ve got you covered!</p>
        <p>Fretting about fading the special edition holographic foil variant covers by accidentally overexposing them to possible sunlight caused by Lex Luthor’s newest plot?</p>
        <p class = "action">POW!</p><p>You’re in the right place!</p>
        <p>We don’t just handle the big name publishing houses, We cover everything from your golden age mythical issues to obscure one off issues, although we probably don’t have your Second Cousin’s comic strip he wrote for that one Zine in Saskatchewan in 1987...sorry.
</p>
        <p class = "action">BIFF!</p><p>At LongBox, you can digitally track and display your collections to your friends, family, colleagues, and nemeses while expressing your inner fan.</p>
        <p><router-link :to="{ name: 'register' }">Register Now</router-link> and Join like minded heroes in the battle to Cherish, Preserve, and Show-Off these masterpieces.</p>
      </div>
    <div class = "image-card">
    <img src = "../assets/spiderman.jpg"/>
     <img src = "../assets/xmen.jpg"/>
     <img src = "../assets/wolverine.jpg"/>
    <!-- <p>You must be authenticated to see this</p> -->
    </div>
    <p> The best Comic Book collection manager!</p>
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
background-color: rgba(45, 136, 240, 0.938);
   color: rgb(249, 243, 243);
   text-shadow: 2px 2px black;
   text-align: center;
   margin:0;
   
 }
  h1{
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
   margin-top:1%;
   font-size: 40px;
 }
 .content-box p{
   text-shadow: none;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  text-size-adjust: 22px;
color: white;
 }
 

</style>
