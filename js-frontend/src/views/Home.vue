<template>
  <div class="container d-flex flex-column align-items-center py-5 rounded">
    <div class="d-flex justify-content-between col border rounded py-3 pl-5 text-left bg-light">
      <router-link to="/"><button class="btn btn-info"><h2  >Bachman Hendricks</h2></button></router-link>
      <div class="align-self-center">
        <router-link to="/register">
          <button type="button" class="btn btn-info border mr-2">Registrera</button>
        </router-link>
        <router-link to="/login">
          <button type="button" class="btn btn-info border">Logga in</button>
        </router-link>
      </div>
    </div>
    <div class="d-flex flex-column container border rounded py-3 text-left bg-light">
      <div class="row m-2">
        <p class="font-weight-bold">Sök boende:</p>
      </div>

      <div class="row m-2">
        <label class="col-3" for="country">Land</label>
        <label class="col-2" for="startdate">Check in</label>
        <label class="col-2" for="enddate">Check out</label>
        <label class="col-1" for="adults">Antal vuxna</label>
        <label class="col-1.5" for="kids">
          Antal barn
          <br />(3-18 år)
        </label>
        <label class="col-2" for="smallkids">
          Antal småbarn
          <br />(0-2 år)
        </label>
      </div>
      <div class="row m-2">
        <select class="border rounded col-md-3" name="country" id="country">
          <option value>-Välj land-</option>
          <option value="Frankrike">Frankrike</option>
          <option value="Spanien">Spanien</option>
          <option value="Luxemburg">Tyskland</option>
        </select>

        <input type="date" class="border rounded col-md-2" name="startdate" placeholder="Check in" />
        <input type="date" class="border rounded col-md-2" name="enddate" placeholder="Check out" />

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
      <button
        v-on:click="runSearch"
        type="button"
        class="align-self-center btn btn-info border col-4 mt-3"
      >Sök</button>
    </div>
    <div class="container bg-light">
      <div class="row border rounded">
        <div
          v-for="room in this.$store.state.home.searchData"
          :key="room.roomId"
          class="d-flex col border rounded"
        >
          <div>
            <img :src="getImageUrl(room.imgLink)" class="image my-3 rounded" />
          </div>
          <div class="d-flex flex-column align-items-start text-left flex-grow-1 my-3 ml-3">
            <p>
              Room Number: {{room.roomNr}}
              <br />
              HotelName: {{room.hotelId}}
              <br />CityName: namn
              <br />ytterligare Information
            </p>
          </div>
          <div class="d-flex justify-content-end align-items-center flex-grow-1">
            <button class="btn btn-info">Boka rum</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },
  created() {
    console.log("load rooms");
    this.$store.dispatch("loadSearchData");
  },
  methods: {
    runSearch: async function() {
      console.log("button clicked! -> run search");
      this.$store.dispatch("loadSearchData");
    },
    getImageUrl: function(file) {
      return require("../assets/images/" + file);
    },
    getHotel() {}
  }
};
</script>

<style scoped>
.image {
  height: 128px;
  width: 192px;
}
</style>