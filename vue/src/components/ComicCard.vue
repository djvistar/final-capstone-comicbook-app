<template>
  <div class="comic-card-main"><!-- need v-bind -->
  <!--
       <router-link v-bind:to="{name: 'book-details'}"><h2 class="book-title">{{ book.title }}</h2></router-link>
    <img v-if="book.isbn" v-bind:src="'http://covers.openlibrary.org/b/isbn/' + book.isbn + '-M.jpg'" />
    <h3 class="book-author">{{ book.author }}</h3>
    <div class="button-container" v-if="! enableAdd">
        <button class="mark-read" v-on:click.prevent="setRead(true)" v-if=" ! book.read">Mark Read</button>
        <button class="mark-unread" v-on:click.prevent="setRead(false)" v-if="book.read">Mark Unread</button>
 -->
  <img v-bind:src="issue.image.small_url" />
    <div class="card-info">
      <h3>{{ issue.name }}</h3>
      <p>Issue # {{ issue.issue_number }}</p>
      <p>{{issue.volume}}</p>
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
.comic-card-main img {
  width: 150px;
}
.comic-card-main {
  display: flex;
  background-color: lightgray;
  margin: 10px;
}
</style>