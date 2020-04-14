<template>
  <div class="home">
    <img alt="Vue logo" src="../assets/logo.png" />
    <HelloWorld msg="Welcome to Your Vue.js App" />

    <div class="dropdown">
      <button
        class="btn dropdown-toggle border col-4"
        type="button"
        id="dropdownCountry"
        data-toggle="dropdown"
        aria-haspopup="true"
        aria-expanded="false"
      >Land</button>
      <div class="dropdown-menu" aria-labelledby="dropdownCountry">
        <a class="dropdown-item" href="#">Frankrike</a>
        <a class="dropdown-item" href="#">Spanien</a>
        <a class="dropdown-item" href="#">Luxemburg</a>
      </div>
    </div>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from "@/components/HelloWorld.vue";

export default {
  name: "Home",
  components: {
    HelloWorld
  }
};
</script>
