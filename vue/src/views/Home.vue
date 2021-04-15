<template>
  <div class="home">
    <div class="test-comic">
      <div class="panel-1">
        <!--<h2>LongBox</h2>
      <img src ="../assets/wolverineorigins.jpg">-->
      </div>
      <div class="panel-2">
        <div class="panel-2-grid">
          <!-- <div class="LongBox"> </div><div id = "info"> -->

          <p id="longboxtitle">LONGBOX</p>
          <p id="info">Your Digital Comic Collection Management System!</p>
        </div>
      </div>

      <div class="panel-3">&nbsp;</div>
      <div class="panel-4">&nbsp;</div>
      <div class="panel-5">
        <div>
          At LONGBOX, you can digitally track and display your collections to
          your friends, family, colleagues, and nemeses while expressing your
          inner fan.
        </div>
      </div>
    </div>
    <div class="lowercontent">
      <h2 class="aboutLongbox" id="aboutLongbox">MEET LONGBOX</h2>
      <div class="content-box">
        <div class="img-1">
          <img class="cbimg" src="../assets/spiderman.jpg" />
        </div>
        <div class="text-elements">
          <p>
            We're your digital comic collection management system! Want to
            display your comics, but you're worried about wrinkling the cover
            while removing them from their hermetically sealed boxes in the
            climate controlled comic storage facility you rented at Xavier’s
            School for Gifted Youngsters to protect all of your precious issues?
          </p>

          <h2 class="action">BAM!</h2>
          <p>We’ve got you covered!</p>
        </div>
      </div>
      <div class="content-box">
        <div class="text-elements">
          <p>
            Fretting about fading the special edition holographic foil variant
            covers by accidentally overexposing them to possible sunlight caused
            by Lex Luthor’s newest plot?
          </p>
          <h2 class="action">POW!</h2>
          <p>You’re in the right place!</p>
        </div>
        <div class="img-1">
          <img class="cbimg" src="../assets/spiderman.jpg" />
        </div>
      </div>

      <div class="content-box">
        <div class="img-1">
          <img class="cbimg" src="../assets/spiderman.jpg" />
        </div>
        <div class="text-elements">
          <p>
            We don’t just handle the big name publishing houses, We cover
            everything from your golden age mythical issues to obscure one off
            issues, although we probably don’t have your Second Cousin’s comic
            strip he wrote for that one Zine in Saskatchewan in 1987...sorry.
          </p>
          <h2 class="action">BIFF!</h2>
          <p>
            At LONGBOX, you can digitally track and display your collections to
            your friends, family, colleagues, and nemeses while expressing your
            inner fan.
          </p>
        </div>
      </div>
      <h2 class="aboutLongbox">JOIN US</h2>
      <div class="CTA">
        <p>
          <router-link :to="{ name: 'register' }">REGISTER NOW</router-link> and
          join like minded heroes in the battle to Cherish, Preserve, and
          Show-Off these masterpieces with LONGBOX - the best Comic Book collection
          manager in the multiverse.
        </p>
      </div>
    </div>
    <home-image-bar />
  </div>
  <!-- <div class="links"></div> -->
</template>

<script>
import HomeImageBar from "@/components/HomeImageBar.vue";
export default {
  name: "home",
  components: { HomeImageBar },
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
  /* text-shadow: 2px 2px black; */
  text-align: center;
  margin: 0;
  margin-top: -20px;

  /* background-image: url("../assets/bg3.jpg");
  background-size:100%;
    background-attachment: scroll; */
  /* background-repeat: repeat; */
}
h1 {
  font-family: "Lucida Sans", "Lucida Sans Regular", "Lucida Grande",
    "Lucida Sans Unicode", Geneva, Verdana, sans-serif;
  margin-top: 1%;
  font-size: 40px;
}

.test-comic {
  display: grid;
  grid-template-columns: repeat(16, 1fr);
  grid-gap: 0.8rem;
  margin-top: 0px;
  box-sizing: border-box;

  /*need to narrow container*/
}

.panel-1 {
  /* src ="../assets/wolverineorigins.jpg"> */
  display: flex;
  justify-content: center;
  align-items: center;
  grid-column: span 6;
  border: solid 5px #fff;
  position: relative;
  overflow: hidden;
  background-image: url("../assets/wolverineorigins.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  height: 100% auto;
}

.panel-2 {
  display: grid;
  display: flex;
  grid-column: span 5;
  border: solid 5px #fff;
  font-size: 25px;
  align-content: center;
  text-align: center;
  justify-content: center;
  color: black;
  text-shadow: none;
  position: relative;
  overflow: hidden;
  background-image: url("../assets/comic-explosion-bubble-2.png");
  background-repeat: no-repeat;
  background-position: center;
  background-size: contain;
  height: 100% auto;
  background-color: #fff;
}
.panel-2-grid {
  display: grid;
  grid-gap: 0.1rem;
}

#longboxtitle {
  font-size: 40px;
  text-shadow: 3px 3px rgb(192, 139, 139);
  font-weight: bold;

  grid-area: longbox;
}
#info {
  grid-area: info;
  font-size: 15px;
  font-weight: bold;
}

.panel-3 {
  display: flex;
  grid-column: span 5;
  border: solid 5px #fff;

  background-image: url("../assets/spidergwen1.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  height: 100% auto;
}

.panel-4 {
  display: flex;
  grid-column: span 7;
  border: solid 5px #fff;
  background-image: url("../assets/Thor.jpg");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  height: 100% auto;
}

.panel-5 {
  display: flex;
  grid-column: span 9;
  border: solid 5px #fff;
  font-size: 25px;
  align-items: center;
  justify-content: baseline;
  color: #fff;
  text-shadow: none;
  position: relative;
  overflow: hidden;
  background-image: url("../assets/lockjaw.png");
  background-repeat: no-repeat;
  background-position: center;
  background-size: cover;
  height: 100% auto;
}

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
  height: 535px;
  padding: 40px 1rem;
  margin: 5px 5 5px 5px /*2rem 0; */;
  background-color: #000;
  box-shadow: 2px 4px 16px rgba(0, 0, 0, 0.2);
}

.collection {
  position: absolute;
  display: block;
  padding: 0.5rem 1rem;
  border: 1px solid #f07739;
  left: 10px;
  top: 10px;
  color: #f07739;
  text-decoration: none;
  font-weight: 700;
}
/* .action{
  color:red;
} */
.CTA {
  display: flexbox;
  background-color: rgba(89, 162, 247, 0.938);
  color: white;
  /* text-shadow: 2px 2px black; */
  text-align: center;
  margin: 0;
  font-size: 24px;
  padding: 10px 75px;
  background: url("../assets/SL-090119-22970-03.jpg");
  background-repeat: no-repeat;
  background-size: 100%;
}
/* .content-box {
  padding: 50px;
  color:black */
/* background-color:rgba(0, 0, 0, 0.8); */
/* display:grid; */
/* } */

.CTA p {
  background-color: rgb(0, 0, 0, .5);
  padding: 20px;
  
}
.content-box p {
  text-shadow: none;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  text-size-adjust: 22px;
  color: black;
  align-content: center;
  text-align: center;
  justify-content: center;
}
.content-box h2 {
  align-content: center;
  text-align: center;
  justify-content: center;
  text-shadow: none;
  font-family: Verdana, Geneva, Tahoma, sans-serif;
  text-size-adjust: 22px;
  color: black;
}
.content-box {
  display: flex;
  /* height:142px; */
  margin: 30px auto;
  padding: 20px 40px;
  align-items: center;
  justify-content:center;
  text-align: justify;
  width: 80%;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
  justify-content: space-between;
}
/* .text-elements{
  display:flex;
    align-items: center;
  justify-content:center 

} */
.aboutLongbox {
  font-size: 50px;
  min-height: 60px;
  width: 100%;
  height: 100%;
  display: flex;
  padding: 5px;
  margin: 0;
  justify-content: space-around;
  align-items: center;
  background-color: #FF165D;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
}
.text-elements{
  margin: 30px auto;
  padding: 20px 40px;
  background-color: #f8f59b;
  width: 80%;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
  
}
/* .images1{
  margin: 30px auto;
  padding: 20px 40px;
  width: 80%;
  display: grid;
  grid-template-columns: repeat(10, 10%);
  grid-gap: 0.8rem;
  margin-top: 0px;
} */

.cbimg {
  height: 212px;
  width: 138px;
  display: flex;
  border: 2px solid black;
  background-color: #ff9a00;
  margin: 0;
  padding: 0;
  border: 5px solid #fff;
  box-shadow: 4px 4px 2px 0px rgba(0, 0, 0, 0.6);
  background-color: #f8f59b;
}
</style>
