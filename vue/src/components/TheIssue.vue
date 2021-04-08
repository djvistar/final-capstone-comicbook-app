<template>
  <div class="the-issue">
      <p id="issue-title">{{issue.title}}</p>
      <p id="volume-name">{{issue.volumeName}}</p><p id="issue-number"> {{issue.number}}</p>
      <p id="issue-image">{{issue.imageURL}}</p>
      <p>Detail fields to be added</p>
      
  </div>
</template>

<script>
export default {
name: the-issue,
data(){
    return{
issue:{
    id: "HardCoded",
    title: "HardCoded",
    number:"HardCoded",
    volumeName: "HardCoded",
    imageURL: "HardCoded",
    
}
}
}
}
</script>

<style>
.the-issue{
    display:grid;
    grid-template-columns: 1fr 1fr 1fr;
    grid-template-areas: 
    "image image title"
    "image image volume"
    "image image number"
    ;

}
#issue-title{
    grid-area: title;
}
#issue-image{
    grid-area: image;
}
#volume-name{
    grid-area: volume;
}
#issue-number{
    grid-area: number;
}
</style>