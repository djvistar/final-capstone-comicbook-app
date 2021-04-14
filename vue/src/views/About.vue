<template>
  <div class="about-main">
    <h1>ABOUT</h1>
<<<<<<< HEAD
    <div class="about-welcome">
      <div class="about-welcome-header">WELCOME TO LONGBOX!</div>
      <div class="about-welcome-content">
        <p>
          <strong>LONGBOX</strong> is a digital content management system for
          your comic book collection.
        </p>
        <p>
          The main purpose of this application is to let you keep track of your
          personal comic book collections by finding the issues you have via our
          comic search tool. Our tool searches a variety of comic book volumes
          and issues from different publishers including but not limited to;
          Marvel, DC Comics, Fox Comics (US), Timely, Fiction House, Ace
          Magazines, Atlas, Gold Key, Red Circle, Epic, Dark Horse Comics and
          many more.
        </p>
      </div>
=======

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
>>>>>>> defe37e54248d0ea929fbb58b753f1b8d9108197
    </div>

    <div class="about-function">
      <div class="about-function-header">WHAT CAN I DO HERE?</div>
      <div class="about-function-content">
        <p>
          &check; As a Guest user, you will be only able to search for comics
          and view collection links shared by LONGBOX users.
        </p>
        <p>
          &check; As a LONGBOX user, you will be able to create your own comic
          book collections, share links, add comics to your collections, remove
          comics from your collections and even delete your collections.
        </p>
        <p>
          To get the best experience of this application, we highly recommend
          that you create an account to best utilize all the resources that we
          offer.
        </p>
        <!-- <p>Thank you for visiting LONGBOX!</p> -->
      </div>
    </div>

    <div class="team">
      <h2>The Team</h2>
    </div>
    <div class="images">
      <div class="abt-img">
        <img src="../assets/bg2.jpg" />
        <div class="name">
          <h2>BLASE</h2>
          <h3>ComicBook Collector</h3>
        </div>
      </div>

      <div class="abt-img">
        <img src="../assets/bg2.jpg" />
        <div class="name">
          <h2>EM</h2>
          <h3>ComicBook Collector</h3>
        </div>
      </div>

      <div class="abt-img">
        <img src="../assets/bg2.jpg" />
        <div class="name">
          <h2>VIC</h2>
          <h3>ComicBook Collector</h3>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "about",
};
</script>

<style>
.about-main {
  background-image: url("../assets/bg7.jpg");
  background-size: 100%;
  background-repeat: no-repeat;
  opacity: 1;
  margin-bottom: -20px;
}
.about-main p {
  font-size: 18px;
  color: #000;
}
.about-welcome,
.about-function {
  margin: 30px auto;
  padding: 20px 0;
  background-color: #f8f59b;
  text-align: justify;
  width: 60%;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
}
.about-welcome-header {
  padding: 10px 20px;
  background-color: #ff165d;
  font-size: 30px;
  color: #fff;
  font-weight: bold;
  text-transform: uppercase;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
}
.about-function-header {
  text-align: left;
  padding: 10px 20px;
  background-color: #ff9a00;
  font-size: 30px;
  color: #fff;
  font-weight: bold;
  text-transform: uppercase;
  box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17);
}

.about-welcome-content,
.about-function-content {
  padding: 5px 40px;
}

.team h2 {
  width: 50%;
  margin: 0 auto;
  padding: 15px;
  background-color: none;
  /* box-shadow: inset 0 -0.5em 0 -0.35em rgba(0, 0, 0, 0.17), 4px 4px 0px 0px rgba(0, 0, 0, 0.6); */
  text-transform: uppercase;
  color: rgb(24, 18, 18);
  font-size: 30px;
}

.images {
  display: flex;
  align-items: center;
  justify-content: space-evenly;
}

.abt-img img {
  border-radius: 70%;
  width: 50%;
  min-height: 175px;
  margin: 20px;
}
</style>