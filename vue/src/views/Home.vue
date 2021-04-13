<template>
  <div class="home">
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
        </div>
      
      <div class="image-card">
        <img src="../assets/spiderman.jpg" />
        <img src="../assets/xmen.jpg" />
        <img src="../assets/wolverine.jpg" />
        <!-- <p>You must be authenticated to see this</p> -->
      </div>
      <p>The best Comic Book collection manager!</p>
    </div>
    <div class="links"></div>
  </div>
  </div>
</template>

<script>
export default {
  name: "home",
};
</script>

<style>
.img-card {
  margin: 3px;
  padding: 5px;
}
/* img{
   
width: 18%;
height: auto;
margin: 10px;
padding: 20px;
  } */

.home {
  display: flexbox;
  background-color: rgba(89, 162, 247, 0.938);
  color: white;
  text-shadow: 2px 2px black;
  text-align: center;
  margin: 0;
}
h1 {
  font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
    "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
  margin-top: 1%;
  font-size: 40px;
}
.main {
}
/*
.experiment {
  display: grid;
  grid-template-columns: repeat(16, 1fr);
  grid-gap: 0.8rem;
  margin: 0 auto;
  background-color: rgba(89, 162, 247, 0.938);
  color: white;
  /*text-shadow: 2px 2px black;*//*
  text-align: center;
  margin: 0;
  font-size: 18px;
}
.spot-1 {
  grid-column: span 6;
}
.spot-2 {
  grid-column: span 5;
}
.spot-3 {
  grid-column: span 5;
}
.spot-4{
  grid-column: span 7;
}
.spot-5 {
  grid-column: span 9;
}
.spot-6 {
  grid-column: span 6;
}
.spot-7{
  grid-column: span 5;
}
.spot-8{
  grid-column: span 5;
}
.experiment{
  background-color: #333745;
  display: grid;
  place-items: start center;
  grid-template-rows: max-content auto;
  gap: 1rem;
  height: 100vh;
}

.comic {
  width: 500px;
  height: 705px;
  padding: 1rem;
  margin: 2rem 0;
  background-color: #fff;
  box-shadow: 2px 4px 16px rgba(0, 0, 0, 0.2);
}

[class^="spot-"] {
  background-color: #eee;
} */

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
