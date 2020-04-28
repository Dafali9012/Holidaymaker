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
    <form
      @submit.prevent="performSearch()"
      class="d-flex flex-column container border rounded py-3 text-left bg-light"
    >
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
        <select
          class="border rounded col-md-3"
          name="country"
          id="country"
          v-on:click="getCountries()"
        >
          <option value="0">Välj Land</option>
          <option
            :value="country.name"
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
          required
        />
        <input
          type="date"
          class="border rounded col-md-2"
          name="enddate"
          placeholder="Check out"
          id="checkOut"
          required
        />

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
      <div class="row">
        <div class="col-3 d-flex flex-column ml-3">
          <div class="d-flex">
            <input class type="checkbox" id="poolCheck" />
            <label for="poolCheck" class="mx-2">Pool</label>
          </div>
          <div class="d-flex">
            <input class type="checkbox" id="entertainmentCheck" />
            <label for="entertainmentCheck" class="mx-2">Kvällsunderhållning</label>
          </div>
          <div class="d-flex">
            <input class type="checkbox" id="barCheck" />
            <label for="barCheck" class="mx-2">Bar</label>
          </div>
          <div class="d-flex">
            <input class type="checkbox" id="saunaCheck" />
            <label for="saunaCheck" class="mx-2">Sauna</label>
          </div>
        </div>
        <div class="d-flex align-items-center col-4">
          <div class="d-flex flex-column">
            <label for="centerDistance">Max distans Centrum</label>
            <div class="d-flex align-items-center">
              <input class="col-8" type="number" id="centerDistance" value="" />
              <p class="">km</p>
            </div>
          </div>
          <div class="d-flex flex-column">
            <label for="beachDistance">Max distans Stranden</label>
            <div class="d-flex align-items-center">
              <input class="col-8" type="number" id="beachDistance" value="" />
              <p class="">km</p>
            </div>
          </div>
        </div>
        <div class="col d-flex flex-column text-center">
          <p>
            <b>Sortera</b>
          </p>
          <div>
            <input class="mr-2" type="radio" id="sortPrice" name="sorting" />
            <label for="sortPrice">Pris (billigast)</label>
          </div>
          <div>
            <input class="mr-2" type="radio" id="sortRating" name="sorting" checked="true" />
            <label for="sortRating">Betyg (högst)</label>
          </div>
        </div>
      </div>
      <button
        type="submit"
        class="align-self-center btn btn-info border col-4 mt-3"
        id="searchButton"
        @click="reserveRoomValues()"
      >Sök</button>
    </form>
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
              <b>{{room.hotelName}}</b>
            </p>
            <p style="font-size:12px;margin:0">
              {{room.countryName+' - '+room.cityName}}
              <br />
              {{room.roomType}} 👤 {{returnCapacity(room.roomType)}}
              <br />
              {{room.kmToCenter}} km till centrum
              <br />
              {{room.kmToBeach}} km till stranden
              <br />
              {{room.pricePerNight}} kr per natt
            </p>
            <div class="d-flex">
              <p v-for="n in room.hotelRating" :key="n">⭐</p>
            </div>
          </div>
          <div class="d-flex justify-content-end align-items-center flex-grow-1">
            <router-link :to="'/room/'+room.roomId">
              <button class="btn btn-info">Info</button>
            </router-link>
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
  created() {
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
      let dateRange = [
        document.getElementById("checkIn").value,
        document.getElementById("checkOut").value
      ];
      let numGuests = [
        document.getElementById("adults").value,
        document.getElementById("kids").value,
        document.getElementById("smallkids").value
      ];
      let amenities = [
        document.getElementById("poolCheck").checked,
        document.getElementById("entertainmentCheck").checked,
        document.getElementById("barCheck").checked,
        document.getElementById("saunaCheck").checked
      ];
      let sortBy =
        document.getElementById("sortPrice").checked == true
          ? "price"
          : "rating";
      let distances = [document.getElementById("centerDistance").value, 
                      document.getElementById("beachDistance").value]
      this.$store.dispatch("loadSearchData", [
        country,
        dateRange,
        numGuests,
        amenities,
        sortBy,
        distances
      ]);
    },
    getImageUrl: function(file) {
      return require("../assets/images/" + file);
    },
    returnCapacity(roomType) {
      if (roomType == "SINGLE") return 1;
      if (roomType == "DOUBLE") return 2;
      if (roomType == "STUDIO") return 4;
    },
    reserveRoomValues: function() {
      console.log("TRYING TO SAVE DATA");

      let newRoomReservation = {
        country_id: document.getElementById("country").value,
        numAdults: document.getElementById("adults").value,
        numKids: document.getElementById("kids").value,
        numSmallKids: document.getElementById("smallkids").value,
        checkIn: document.getElementById("checkIn").value,
        checkOut: document.getElementById("checkOut").value
      };
      console.log("reserve room data", this.newRoomReservation);
      this.$store.dispatch("reserveRoomData", newRoomReservation);
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