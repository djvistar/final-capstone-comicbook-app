<template>
  <div class="about-main">
    <h1>ABOUT</h1>

<div class = "welcome">
  <h2>Welcome to LONGBOX!</h2>
        <p>The main purpose of this application is to give you access to a variety of comicbook collections and issues from different publishers including but not
          limited to; Marvel, DC Comics, Fox Comics(US), Timely, Fiction House, Ace Magazines, Atlas, Gold Key, 
          Red Circle, Epic, Dark Horse Comics and many more.</p>
</div>

<div class = "team">
  <h2> The Team</h2>
</div>
<div class="images">
  
  <div class="abt-img">
      <img src="../assets/bg2.jpg" > 
    <div class="name">
      <h2> BLASE </h2>
       <h3> ComicBook Collector</h3>
    </div>
  </div>


  <div class="abt-img">
      <img src="../assets/bg2.jpg" > 
    <div class="name"> 
      <h2> EM </h2>
      <h3> ComicBook Collector</h3>
    </div>
 
</div>


  <div class="abt-img">
      <img src="../assets/bg2.jpg" > 
    <div class="name">
      <h2> VIC </h2>
       <h3> ComicBook Collector</h3>
    </div>
  </div>
</div>

  
    <div class="text-content">

       <p>As a guest user, you will be able to search for comics, create an account by clicking on the "Register" button above
        and logging into your account.</p>
      <p>As a logged in user, you will be able to create your own comicbook collections, add comics to your collections,
    remove comics from your collections and even delete your collections.</p>
    <p> To get the best experience of this application, we highly recommend that you create an account to best utilize all the resources
      that we offer.</p>
      <p>Thank you for visiting LONGBOX!</P>
    </div>
  </div>
</template>

<script>
export default {
  name: "about",
};
</script>

<style>
.about-main{
  background-image: url("../assets/bg7.jpg");
  background-size: 100%;
  background-repeat: no-repeat;
  opacity: 1;
}
.welcome{
   margin: 30px auto;
  padding: 20px 40px;
  background-color: #f8f59b;
  text-align: justify;
  width: 80%;

  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
}

.welcome h2{
 text-align: center;
}

.team h2{
   width: 50%;
  margin: 0 auto;
  padding: 15px;
  background-color: none;
  /* box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17), 4px 4px 0px 0px rgba(0, 0, 0, 0.6); */
  text-transform: uppercase;
  color: rgb(24, 18, 18);
  font-size: 30px;
  
 
}
.text-content {
  margin: 30px auto;
  padding: 20px 40px;
  background-color: #f8f59b;
  text-align: justify;
  width: 80%;

  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
}
.about-main p {
  font-size: 18px;
  color: #000;
  
}
.images{
 
   display: flex;
  align-items: center;
  justify-content: space-evenly;

}

.abt-img img{
 border-radius: 70%;
  width: 50%;
  min-height: 175px;
  margin: 20px;
}


</style>