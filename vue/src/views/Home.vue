<template>
  <div class="home">
    <!-- <h1>Welcome To LongBox Comics</h1> -->

    
    <div class = "test-comic">
    <div class="panel-1" >
      <!--<h2>LongBox</h2>
      <img src ="../assets/wolverineorigins.jpg">-->
    </div>
    <div class="panel-2">
      <div class="LongBox">LongBox </div><div id = "info">
        your digital comic collection management system!
        </div></div>
      
      
    <div class="panel-3">&nbsp;</div>
    <div class="panel-4">&nbsp;</div>
    <div class="panel-5">
      <div>At LongBox, you can digitally track and display your collections to your friends, family, colleagues, and nemeses while expressing your inner fan.</div>
      <!-- <img src = "../assets/lockjaw.jpg"> -->
      </div>
      </div>
      <div class="content-box">
      <p>
        Meet LongBox, your digital comic collection management system! Want to
        display your comics, but you're worried about wrinkling the cover while
        removing them from their hermetically sealed boxes in the climate
        controlled comic storage facility you rented at Xavier’s School for
        Gifted Youngsters to protect all of your precious issues?
      </p>
      <p class="action">BAM!</p>
      <p>We’ve got you covered!</p>
      <p>
        Fretting about fading the special edition holographic foil variant
        covers by accidentally overexposing them to possible sunlight caused by
        Lex Luthor’s newest plot?
      </p>
      <p class="action">POW!</p>
      <p>You’re in the right place!</p>
      <p>
        We don’t just handle the big name publishing houses, We cover everything
        from your golden age mythical issues to obscure one off issues, although
        we probably don’t have your Second Cousin’s comic strip he wrote for
        that one Zine in Saskatchewan in 1987...sorry.
      </p>
      <p class="action">BIFF!</p>
      <p>
        At LongBox, you can digitally track and display your collections to your
        friends, family, colleagues, and nemeses while expressing your inner
        fan.
      </p>
      <p>
        <router-link :to="{ name: 'register' }">Register Now</router-link> and
        Join like minded heroes in the battle to Cherish, Preserve, and Show-Off
        these masterpieces.
      </p>
    </div>

    <!-- <div class="home">
    <h1>Welcome To LongBox Comics</h1>
    <div class="main">
      <div class="sizzle">
        <div class = "experiment">
        <div class="spot-1"><div>
          Meet LongBox, your digital comic collection management system! Want to
          display your comics, but you're worried about wrinkling the cover
          while removing them from their hermetically sealed boxes in the
          climate controlled comic storage facility you rented at Xavier’s
          School for Gifted Youngsters to protect all of your precious issues?
          </div>
        </div>
        <div class="spot-2"><div id="action1">BAM!</div></div>
        <div class="spot-3"> <div id="answer1">We’ve got you covered!</div></div>
        <div class="spot-4">
          Fretting about fading the special edition holographic foil variant
          covers by accidentally overexposing them to possible sunlight caused
          by Lex Luthor’s newest plot?
        </div>
        <div class="spot-5" id="action2">POW!</div>
        <div class="spot-6" id="answer2">You’re in the right place!</div>
        <div class="spot-7">
          We don’t just handle the big name publishing houses, We cover
          everything from your golden age mythical issues to obscure one off
          issues, although we probably don’t have your Second Cousin’s comic
          strip he wrote for that one Zine in Saskatchewan in 1987...sorry.
        </div>
        
        <div class="spot-8" id="action3">BIFF!</div>
        </div>
        <div class="spot-9" id="answer3">
          At LongBox, you can digitally track and display your collections to
          your friends, family, colleagues, and nemeses while expressing your
          inner fan.
        </div>
        <div class="CTA">
          <router-link :to="{ name: 'register' }">Register Now</router-link> and
          Join like minded heroes in the battle to Cherish, Preserve, and
          Show-Off these masterpieces.
        </div> -->

    <!-- <div class="image-card">

      <img src="../assets/spiderman.jpg" />
      <img src="../assets/xmen.jpg" />
      <img src="../assets/wolverine.jpg" />
   
    </div> -->
    <p>The best Comic Book collection manager!</p>
  </div>
  <!-- <div class="links"></div> -->
</template>

<script>
export default {
  name: "home",
};
</script>

<style>
.image-card {
  width: 60%;
  margin: 0 auto;
  padding: 5px;
}

.image-card img {
  width: 200px;
  height: auto;
  margin: 10px;
}

.home {

  display: flexbox;
  /* background-color: rgba(45, 136, 240, 0.938); */
  color: rgb(249, 243, 243);
  text-shadow: 2px 2px black;
  text-align: center;
  margin: 0;
  background-image: url("../assets/bg3.jpg");
  background-size:100%;
    background-attachment: scroll;
    /* background-repeat: repeat; */
}
h1 {
  font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
    "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
  margin-top: 1%;
  font-size: 40px;
}
.content-box{
  background-color:rgba(0, 0, 0, 0.8)
}
.content-box p {

  text-shadow: none;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  text-size-adjust: 22px;
  color: white;
  
  
}
.test-comic {
    display: grid;
    grid-template-columns: repeat(16, 1fr);
    grid-gap: 0.8rem;
    margin-top: 0px;
    /*need to narrow container*/
    
  }
  
  .panel-1 {
    /* src ="../assets/wolverineorigins.jpg"> */
      display:flex;
      justify-content: center;
      align-items: center; 
      grid-column: span 6;
      border: solid 3px Black;
      position: relative;
      overflow:hidden; 
      background-image: url("../assets/wolverineorigins.jpg");
    background-repeat: no-repeat;
    background-position: center;
    background-size:cover;
    height: 100% auto;
  }
/* .panel-1 h2{
  padding: 10px;
    text-align: center;
    z-index: 2;
    position: relative;
    color: #000;
}
.panel-1 img{
  position:absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: auto;
  z-index: 1;
  opacity: 0.3;
} */
   /* .panel::after{
    content:"LongBox";
    background-image: url("../assets/wolverine.jpg");
    background-repeat: no-repeat;
    background-position: center;
    background-size: cover; /*need to adjust from contain */
    /* height: 100% auto;
    opacity: 0.5;  */
 /*   transform: rotate(18deg);
    overflow: hidden; 
    color:mediumslateblue;
    background-color:transparent;
    font-size: 450%; */
  /* } */
   
   
  .panel-2 {
    display:grid;
    display:flex;
    grid-column: span 5;
    border: solid 3px Black;
    font-size: 25px;
    align-items: center;
    text-align: center;
    justify-content:center;
    color:black;
    text-shadow: none;
    position: relative;
    overflow:hidden; 
    background-image: url("../assets/comic-explosion-bubble-2.png");
    background-repeat: no-repeat;
    background-position: center;
    background-size:cover;
    height: 100% auto;
    grid-auto-rows: auto;
    grid-template-areas: 
    "longbox"
    "info"
    ;
  }
  /* .panel-2 div{
  padding: 20px;
    text-align: center;
    z-index: 2;
    position: relative;
    color: #000;
     */
  /* } */
  .LongBox{
font-size: 45px;
text-shadow: 3px 3px rgb(192, 139, 139);
font-weight:bold;
grid-area: longbox;
  }
  #info{
    grid-area: info;
  } 
  /* .panel-2 img{
  
  position:absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: auto;
  z-index: 1;
  opacity: 0.3;
  
  } */
  
  .panel-3 {
    display:flex;
    grid-column: span 5;
    border: solid 3px Black;
   
    background-image: url("../assets/spidergwen1.jpg");
    background-repeat: no-repeat;
    background-position: center;
    background-size:cover;
    height: 100% auto;
  }
  
  .panel-4 {
    display:flex;
    grid-column: span 7;
    border: solid 3px Black;
    background-image: url("../assets/Thor.jpg");
    background-repeat: no-repeat;
    background-position: center;
    background-size:cover;
    height: 100% auto;
  }
  
  .panel-5 {
    display:flex;
    grid-column: span 9;
    border: solid 3px Black;
    font-size: 25px;
    align-items: center;
    justify-content:baseline;
    color:black;
    text-shadow: none;
    position: relative;
    overflow:hidden; 
    background-image: url("../assets/lockjaw.png");
    background-repeat: no-repeat;
    background-position: center;
    background-size:cover;
    height: 100% auto;
  }

  /* } */
  /* .panel-5 div{
 padding: 50px;
    text-align: center;
    z-index: 2;
    position: relative;
    color: #000;
  }
  .panel-5 img{
  position:absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: auto;
  z-index: 1;
  opacity: 0.3;
  } */
  
  
  
  /* Themeing */
  
  body {
    background-color: #333745;
    display: grid;
    place-items: start center;
    grid-template-rows: max-content auto;
    gap: 1rem;
    height: 100vh;
  }
  
  .test-comic {
    width: 100%;
    height: 465px;
    padding: 1rem;
    margin: 2rem 0;
    background-color: #fff;
    box-shadow: 2px 4px 16px rgba(0, 0, 0, 0.2);
  }
  
  [class^="panel-"] {
    
  }
  
  .collection {
    position: absolute;
    display: block;
    padding: 0.5rem 1rem;
    border: 1px solid #F07739;
    left: 10px;
    top: 10px;
    color: #F07739;
    text-decoration: none;
    font-weight: 700;
    
   /*&:hover {
      background-color: #F07739;
      color: #333745;
    }*/
  }

.CTA {
  display: flexbox;
  background-color: rgba(89, 162, 247, 0.938);
  color: white;
  text-shadow: 2px 2px black;
  text-align: center;
  margin: 0;
  font-size: 24px;
}
</style>
