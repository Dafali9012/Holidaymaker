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
      <div class="row m-1" id="containerForInfo">
        <div class="col-12 rounded py-3 text-left">
          <div class="row">
            <div class="col-sm-12 col-md-6">
              <!--
              Lägg till val för antal gäster av olika åldrar,
              Skriv ut val av check-in/out som matades in vid
              söktillfället.
              Räkna ut pris efter hur många dagar man har valt
              och skriv ut totalpriset
              -->
              <p style="font-size:20px;margin:0">
                <b>{{ room.hotelName }}</b>
              </p>
              <p style="font-size:18px;margin:0">{{ room.countryName + " - " + room.cityName }}</p>
              <p style="font-size:18px;margin:0">{{ room.pricePerNight }} kr per natt</p>
              <p style="font-size:18px;margin:0">{{ room.kmToCenter }} km till centrum</p>
              <p style="font-size:18px;margin:0">{{ room.kmToBeach }} km till stranden</p>
              <div class="d-flex">
                <p v-for="n in room.hotelRating" :key="n">⭐</p>
              </div>
              <p style="font-size:18px;margin:0">
                <b>Adress:</b>
              </p>
              <p style="font-size:18px;margin:0">{{ room.hotelAddress }}</p>
              <br />
              <p style="font-size:18px;margin:0">
                <b>Telefon:</b>
              </p>
              <p style="font-size:18px;margin:0">{{ room.hotelPhone }}</p>
              <br />

              <div class="row">
                <div class="col-6">
                  <p style="font-size:16px;margin:0">
                    <b>Check-in:</b>
                  </p>
                  <p style="font-size:16px;margin:0">{{ reservation.checkIn }}</p>
                  <br />
                </div>
                <div class="col-6">
                  <p style="font-size:16px;margin:0">
                    <b>Check-out:</b>
                  </p>
                  <p style="font-size:16px;margin:0">{{ reservation.checkOut }}</p>
                  <br />
                </div>
                <div class="col-6">
                  <p style="font-size:16px;margin:0">
                    <b>Antal vuxna:</b>
                  </p>
                  <p style="font-size:16px;margin:0">{{ reservation.numAdults}}</p>
                  <br />
                </div>
                <div class="col-6">
                  <p style="font-size:16px;margin:0">
                    <b>Antal barn:</b>
                  </p>
                  <p
                    style="font-size:16px;margin:0"
                  >{{ reservation.numKids }} + {{ reservation.numSmallKids }}</p>
                  <br />
                </div>
              </div>

              <p style="font-size:18px;margin:0">
                <b>Totalpris:</b>
              </p>
              <p style="font-size:18px;margin:0">{{ room.pricePerNight * numNights }}:-</p>
              <br />
            </div>
            <div class="col-sm-12 col-md-6">
              <img :src="getImageUrl(room.imgLink)" class="image my-3 rounded" />
            </div>
          </div>
        </div>
      </div>

      <div class="row m-1">
        <div class="col-sm-12 col-6">
          <div class="form-group">
            <label for="board">Välj pension:</label>
            <select class="form-control" id="exampleFormControlSelect1">
              <option value="NONE">Ingen</option>
              <option value="HB">Halvpension</option>
              <option value="FB">Helpension</option>
              <option value="AI">All Inclusive</option>
            </select>
          </div>
        </div>
      </div>

      <div class="row m-1">
        <div class="col-6">
          <div class="form-check mb-3">
            <input type="checkbox" class="form-check-input" id="extraBed" />
            <label class="form-check-label" for="extraBed">Extra säng</label>
          </div>
        </div>
      </div>

      <div class="row m-1 justify-content-between">
        <div class="col-2">
          <router-link to="/">
            <button
              type="button"
              class="btn btn-info d-flex justify-content-end align-items-start"
              id="backButton"
            >Tillbaka</button>
          </router-link>
        </div>

        <div class="col-2 text-right">
          <button class="btn btn-info">Boka nu</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      numNights: ""
    };
  },
  created() {
    this.$store.dispatch("loadRooms");
    this.getNumberOfNights();
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
    },
    reservation() {
      let reservation = this.$store.state.home.reservation;
      console.log("reservation workz ", reservation);
      return reservation;
    }
  },
  methods: {
    getImageUrl: function(file) {
      return require("../assets/images/" + file);
    },
    getNumberOfNights: function(){
      let reservation = this.$store.state.home.reservation;
      let date1 = new Date(reservation.checkIn);
      var date2 = new Date(reservation.checkOut);
      var timeDiff = Math.abs(date2.getTime() - date1.getTime());
      return this.numNights = Math.ceil(timeDiff / (1000 * 3600 * 24)); 
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
