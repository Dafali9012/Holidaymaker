<template>
  <div class="container align-items-center py-5 rounded">
    <div class="d-flex justify-content-between col border rounded py-3 pl-5 text-left bg-light">
      <router-link to="/">
        <button class="btn btn-info" id="homeButton">
          <h2>Bachman Hendricks</h2>
        </button>
      </router-link>
      <div v-if="this.$store.state.loggedInUser.userId" class="align-self-center">
        <router-link to="/myBookings">
          <button type="button" class="btn btn-info border mr-2" id="myBookingsButton">Min sida</button>
        </router-link>
        <a href="http://localhost:8080/logout">
          <button type="button" class="btn btn-info border" id="logoutButton">Logga ut</button>
        </a>
      </div>
      <div v-else class="align-self-center">
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
                  <p style="font-size:16px;margin:0">{{ this.$store.state.roomReservation.checkIn }}</p>
                  <br />
                </div>
                <div class="col-6">
                  <p style="font-size:16px;margin:0">
                    <b>Check-out:</b>
                  </p>
                  <p
                    style="font-size:16px;margin:0"
                  >{{ this.$store.state.roomReservation.checkOut }}</p>
                  <br />
                </div>
                <div class="col-6">
                  <p style="font-size:16px;margin:0">
                    <b>Antal vuxna:</b>
                  </p>
                  <p
                    style="font-size:16px;margin:0"
                  >{{ this.$store.state.roomReservation.numAdults }}</p>
                  <br />
                </div>

                <div class="col-6">
                  <p
                    style="font-size:16px;margin:0"
                    v-if="this.$store.state.roomReservation.numKids > 0"
                  >
                    <b>Antal barn:</b>
                    {{ this.$store.state.roomReservation.numKids }} (3-18 år)
                  </p>
                  <p
                    style="font-size:16px;margin:0"
                    v-if="this.$store.state.roomReservation.numSmallKids > 0"
                  >
                    <b>Antal småbarn:</b>
                    {{ this.$store.state.roomReservation.numSmallKids }} (0-2 år)
                  </p>
                  <br />
                </div>
              </div>

              <p style="font-size:18px;margin:0">
                <b>Totalpris:</b>
              </p>
              <p
                style="font-size:18px;margin:0"
              >{{ this.$store.state.roomReservation.totalRoomPrice }}:-</p>
              <br />
              <p style="font-size:16px;margin:0">
                <b>Tillägg:</b>
              </p>
              <!--
              <p style="font-size:16px;margin:0" v-if="addition1 !== ''">
                {{ addition1 }}: {{ addComma(boardPrice) }}:- pp/natt
                ({{ addComma(totalBoardPrice) }}:- av totalpriset)
                <br />
              </p>
            
              <p
                style="font-size:16px;margin:0"
                v-if="addition2 !== ''"
              >{{ addition2 }}, {{ extraBedPrice }}:-</p>-->
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
            <label for="board">Välj tillägg:</label>
            <select @change="updateTotalPrice()" class="form-control" id="board">
              <option value="NONE" selected>Inget</option>
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
            <input
              @change="updateTotalPrice()"
              type="checkbox"
              class="form-check-input"
              id="extraBed"
              true-value="1"
              false-value="0"
            />
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
          <button v-on:click="loginCheck()" class="btn btn-info">Boka</button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  created() {
    this.initialTotalPrice();
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
      return require("@/assets/images/" + file);
    },

    loginCheck() {
      if (this.$store.state.loggedInUser.userId) {
        this.makeReservation();
      } else {
        this.$router.push("/register");
      }
    },
    async makeReservation() {
      let roomReservation = this.$store.state.roomReservation;
      roomReservation.board = document.getElementById("board").value;
      roomReservation.extraBed = document.getElementById("extraBed").checked
        ? 1
        : 0;
      roomReservation.room = this.$route.params.room;
      roomReservation.user = this.$store.state.loggedInUser.userId;

      console.log("påväg att boka: ");
      console.log(roomReservation);

      await fetch("http://localhost:8080/reservedroom", {
        method: "POST",
        body: JSON.stringify(roomReservation),
        headers: {
          "Content-Type": "application/json"
        }
      });
      window.confirm("Din bokning har genomförts")
      this.$router.push('/myBookings')
    },
    initialTotalPrice() {
      let reservation = this.$store.state.roomReservation;
      reservation.totalRoomPrice = this.room.pricePerNight;
      this.$store.commit("changeRoomReservation", reservation);
    },
    updateTotalPrice() {
      let reservation = this.$store.state.roomReservation;
      reservation.extraBed = document.getElementById("extraBed").checked
        ? 1
        : 0;

      let sumPrice = 0;

      if (document.getElementById("board").value == "HB") {
        sumPrice += this.room.hbPrice;
      } else if (document.getElementById("board").value == "FB") {
        sumPrice += this.room.fbPrice;
      } else if (document.getElementById("board").value == "AI") {
        sumPrice += this.room.aiPrice;
      }

      sumPrice += this.room.pricePerNight;
      if (reservation.extraBed == 1) sumPrice += this.room.extraBedPrice;
      reservation.totalRoomPrice = sumPrice;
      this.$store.commit("changeRoomReservation", reservation);
    }
  }
};
</script>

<style scoped>
.image {
  width: 100%;
  height: 50%;
}
</style>
