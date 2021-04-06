<template>
  
  <div class = "container">
    <div class="comic-card-main"><!-- need v-bind -->
  <!--
       <router-link v-bind:to="{name: 'book-details'}"><h2 class="book-title">{{ book.title }}</h2></router-link>
    <img v-if="book.isbn" v-bind:src="'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'" />
    <h3 class="book-author">{{ book.author }}</h3>
    <div class="button-container" v-if="! enableAdd">
        <button class="mark-read" v-on:click.prevent="setRead(true)" v-if=" ! book.read">Mark Read</button>
        <button class="mark-unread" v-on:click.prevent="setRead(false)" v-if="book.read">Mark Unread</button>
 -->
  
    <div class="comic-card-info">
      <img id = "image" v-bind:src="issue.image.small_url" />
      <div id = "name">{{ issue.name }}</div>
      <div id = "volume">{{issue.volume.name}}</div>
      <div id ="issue_number">Issue # {{ issue.issue_number }}</div>
      <div id="summary">{{issue.description}}</div>
  </div>
  </div>
  </div>
</template>

<script>
export default {
name: 'comic-card',
props: {
    issue: Object,
    //for add to collection
    // enableAdd:{
    //     type:Boolean,
    //     default:false
    // }
}
}
</script>

<style>
.container{
  background-color: #e63030;
  
}
.comic-card-main img {
  
  grid-area: image;
}
.comic-card-main {
  background-color: lightgray;
  padding: 40px 55px;
  margin: 15px 0;
  background-color: #00AFEF;
  color: rgb(0, 0, 0);
  border: solid 1px #777;
  display: flex;
  justify-content:space-evenly ;
  padding: 10px;
  
}
.comic-card-info{
  display: grid; 
  background-color: #F0F0F0;
   grid-template-columns: 1fr 1fr;
  grid-template-rows: 1fr 1fr 1fr 1fr;
  grid-template-areas:
  "image name"
  "image volume"
  "image issue_number"
  "summary summary"

}

#name{
  grid-area:name;
}
#issue_number{
  grid-area: issue_number;
}
#volume{
  grid-area: volume;
}
#summary{
  grid-area: summary;
}
</style>