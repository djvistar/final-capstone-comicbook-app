<template>
  <div class="collection-card-main">
    {{ collection.name }}
  </div>
</template>

<script>
export default {
  name: "collection-card",
  props: {
    collection: Object,
  }
};
</script>

<style>
</style>