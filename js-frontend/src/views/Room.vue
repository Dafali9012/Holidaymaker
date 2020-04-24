<template>
  <div class="container align-items-center py-5 rounded">
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
    <div class="container border rounded py-3 text-left bg-light">
      <div class="row m-1">
        <div class="col-3 border rounded py-3 text-left">
          <p class="font-weight-bold">Sök</p>
          <div class="row m-1">
            <label class="col-12" for="country">Land</label>
            <select class="border rounded col-auto text-center" name="country" id="country">
              <option value>-Välj land-</option>
              <option value="Frankrike">Frankrike</option>
              <option value="Spanien">Spanien</option>
              <option value="Luxemburg">Luxemburg</option>
            </select>
            <label class="col-12" for="startdate">Check in</label>
            <input
              type="date"
              class="border rounded col-auto"
              name="startdate"
              placeholder="Check in"
            />
            <label class="col-12" for="enddate">Check out</label>
            <input
              type="date"
              class="border rounded col-auto"
              name="enddate"
              placeholder="Check out"
            />
            <label class="col-12" for="adults">Antal vuxna</label>
            <select class="border rounded col-auto" name="adults" id="adults">
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
            <label class="col-12" for="kids">Antal barn (3-18 år)</label>
            <select class="border rounded col-auto" name="kids" id="kids">
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
            <label class="col-12" for="smallkids">Antal småbarn (0-3 år)</label>
            <select class="border rounded col-auto" name="smallkids" id="smallkids">
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
            <button type="submit" class="btn btn-info border col-12 mt-3">Sök</button>
          </div>
        </div>
        <div class="col-9 rounded py-3 text-left">
          <div class="row">
            <div class="col-6">
              <!--
              Lägg till val för antal gäster av olika åldrar,
              Skriv ut val av check-in/out som matades in vid
              söktillfället.
              Räkna ut pris efter hur många dagar man har valt
              och skriv ut totalpriset
              -->
              <p style="font-size:20px;margin:0">
                <b>{{room.hotelName}}</b>
              </p>
              <p style="font-size:18px;margin:0">{{room.countryName+' - '+room.cityName}}</p>
              <p style="font-size:18px;margin:0">{{room.pricePerNight}} kr per natt</p>
              <p style="font-size:18px;margin:0">{{room.kmToCenter}} km till centrum</p>
              <p style="font-size:18px;margin:0">{{room.kmToBeach}} km till stranden</p>
              <div class="d-flex">
                <p v-for="n in room.hotelRating" :key="n">⭐</p>
              </div>
              <p style="font-size:18px;margin:0">
                <b>Adress:</b>
              </p>
              <p style="font-size:18px;margin:0">{{room.hotelAddress}}</p>
              <br />
              <p style="font-size:18px;margin:0">
                <b>Telefon:</b>
              </p>
              <p style="font-size:18px;margin:0">{{room.hotelPhone}}</p>
            </div>
            <div class="col-6">
              <img :src="getImageUrl(room.imgLink)" class="image my-3 rounded" />
            </div>
            <div class="d-flex justify-content-end align-items-end col">
                <button class="btn btn-info">Boka</button>            
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  created() {
    this.$store.dispatch("loadRooms");
  },
  computed: {
    room() {
      let r = {};
      for (let room of this.$store.state.home.rooms) {
        if (room.roomId == this.$route.params.room) {
          r = room;
          break;
        }
      }
      return r;
    }
  },
  methods: {
    getImageUrl: function(file) {
      return require("../assets/images/" + file);
    }
  }
};
</script>

<style scoped>
.image {
  width: 100%;
  height: 80%;
}
</style>