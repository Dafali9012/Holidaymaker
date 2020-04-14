<template>
  <div class="container align-items-center">
    <div class="d-flex justify-content-between col border rounded py-3 pl-5 text-left">
      <h2>Bachman Hendricks</h2>
      <div>
        <router-link to="/register">
          <button type="button" class="btn btn-light border">Registrera</button>
        </router-link>
                <router-link to="/login">
        <button type="button" class="btn btn-light border">Logga in</button>
                </router-link>
      </div>
    </div>
    <form class="col border rounded py-3 pl-5 text-left">
      <p class="font-weight-bold">Sök boende:</p>
      <div class="dropdown">
  <button class="btn dropdown-toggle border col-4" type="button" id="dropdownCountry" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    Land
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownCountry">
    <a class="dropdown-item" href="#">Frankrike</a>
    <a class="dropdown-item" href="#">Spanien</a>
    <a class="dropdown-item" href="#">Luxemburg</a>
  </div>
</div>
      <input type="text" name="date" class="col-4" placeholder=" "/>
      <input type="text" name="guests" class="col-4" placeholder=" "/>
      <button type="submit" class="btn btn-light border col-4 mt-3">Sök</button>
    </form>
  </div>
  
</template>

<script>
// @ is an alias to /src
// import HelloWorld from '@/components/HelloWorld.vue'

// export default {
//   name: 'Home',
//   components: {
//     HelloWorld
//   }
// }
</script>
