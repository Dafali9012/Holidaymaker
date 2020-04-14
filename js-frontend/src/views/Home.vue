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
    <div class="container border rounded py-3 text-left">
      <div class="row m-2">
      <p class="font-weight-bold">Sök boende:</p>
      </div>
    <div class="row m-2">
      <label class="col-3" for="country">Land</label>
      <label class="col-2" for="startdate">Check in</label>
      <label class="col-2" for="enddate">Check out</label>
      <label class="col-1" for="adults">Antal vuxna</label>
      <label class="col-1.5" for="kids">Antal barn <br> (3-18 år)</label>
      <label class="col-2" for="kids">Antal småbarn <br> (0-3 år)</label>
      
    </div>
      <div class="row m-2">
    <select class="border rounded col-md-3" name="country" id="country">
    <option value="">-Välj land-</option>
    <option value="Frankrike">Frankrike</option>
    <option value="Spanien">Spanien</option>
    <option value="Luxemburg">Luxemburg</option>
</select>

      <input type="date" class="border rounded col-md-2" name="startdate" placeholder="Check in"/>
            <input type="date" class="border rounded col-md-2" name="enddate" placeholder="Check out"/>

    <select class="border rounded col-md-1" name="adults" id="adults">
    <option value="0">0</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
</select>
    <select class="border rounded col-md-1" name="kids" id="kids">
    <option value="0">0</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
</select>
    <select class="border rounded col-md-1" name="smallkids" id="smallkids">
    <option value="0">0</option>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
</select>
      </div>
      <button type="submit" class="btn btn-light border col-12 mt-3">Sök</button>
    </div>
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
