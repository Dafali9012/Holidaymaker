<template>
  <div class="container d-flex flex-column align-items-center py-5 rounded">
    <div class="d-flex justify-content-between col border rounded py-3 pl-5 text-left bg-light">
      <router-link to="/">
        <button class="btn btn-info" id="homeButton">
          <h2>Bachman Hendricks</h2>
        </button>
      </router-link>
      <div class="align-self-center">
        <router-link to="/register">
          <button type="button" class="btn btn-info border mr-2" id="regButton">Registrera</button>
        </router-link>
        <router-link to="/login">
          <button type="button" class="btn btn-info border" id="loginButton">Logga in</button>
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
          <option value="0">Välj Land</option>
          <option
            :value="country.country_id"
            v-for="country in countries"
            :key="country.countryId"
          >{{ country.name }}</option>
        </select>
        <input
          type="date"
          class="border rounded col-md-2"
          name="startdate"
          placeholder="Check in"
          id="checkIn"
        />
        <input
          type="date"
          class="border rounded col-md-2"
          name="enddate"
          placeholder="Check out"
          id="checkOut"
        />

        <select class="border rounded col-md-1" name="adults" id="adults">    
          <option v-for="n in 10" :key="n" :value="n-1">{{n-1}}</option>
        </select>
        <select class="border rounded col-md-1" name="kids" id="kids">
          <option v-for="n in 10" :key="n" :value="n-1">{{n-1}}</option>
        </select>
        <select class="border rounded col-md-1" name="smallkids" id="sKids">
          <option v-for="n in 10" :key="n" :value="n-1">{{n-1}}</option>
        </select>
      </div>
      <button
        v-on:click="performSearch"
        type="button"
        class="align-self-center btn btn-info border col-4 mt-3"
        id="searchButton"
      >Sök</button>
    </div>
    <div class="container bg-light">
      <div class="row border rounded">
        <div
          v-for="room in this.$store.state.home.searchData"
          :key="room.roomId"
          class="d-flex col-6 border rounded"
        >
          <div>
            <img :src="getImageUrl(room.imgLink)" class="image my-3 rounded" />
          </div>
          <div class="d-flex flex-column align-items-start text-left flex-grow-1 my-3 ml-3">
            <p style="font-size:16px;margin:0">
              <b>{{ room.hotelName }}</b>
            </p>
            <p style="font-size:12px;margin:0">
              {{ room.cityName }}
              <br />
              {{ room.kmToCenter }} km till centrum
              <br />
              {{ room.kmToBeach }} km till stranden
              <br />
              {{ room.pricePerNight }} kr per natt
            </p>
            <div class="d-flex">
              <p v-for="n in room.hotelRating" :key="n">⭐</p>
            </div>
          </div>
          <div class="d-flex justify-content-end align-items-center flex-grow-1">
            <button class="btn btn-info" id="reserveRoom" v-on:click="reserveRoom()">Boka rum</button>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      countries: []
    };
  },
  mounted() {
    console.log(this.numAdults);
    this.getCountries();
  },
  methods: {
    getCountries: async function() {
      let url = "http://localhost:8080/country";
      const result = await fetch(url);
      this.countries = await result.json();
    },
    performSearch: async function() {
      console.log("search button clicked");
      let country = document.getElementById("country").value;
      this.$store.dispatch("loadSearchData", country);
    },
    getImageUrl: function(file) {
      return require("../assets/images/" + file);
    },

    reserveRoom: function() {
      let newRoomReservation = {
        country_id: document.getElementById("country").value,
        numAdults: document.getElementById("adults").value,
        numKids: document.getElementById("kids").value,
        numSmallKids: document.getElementById("sKids").value,
        checkIn: document.getElementById("checkIn").value,
        checkOut: document.getElementById("checkOut").value
      };
      //console.log('reserve room data', this.newRoomReservation)
      this.$store.dispatch("reserveRoom", newRoomReservation);
      this.$router.push("/hotelinfo");
    }
  }
};
</script>

<style scoped>
.image {
  height: 128px;
  width: 192px;
}
</style>
