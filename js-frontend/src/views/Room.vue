<template>
  <div class="container align-items-center py-5 rounded">
    <div
      class="d-flex justify-content-between col border rounded py-3 pl-5 text-left bg-light"
    >
      <router-link to="/">
        <button class="btn btn-info" id="homeButton">
          <h2>Bachman Hendricks</h2>
        </button>
      </router-link>
      <div v-if="this.$store.state.loggedInUser.userId" class="align-self-center">
        <router-link to="/myBookings">
          <button type="button" class="btn btn-info border mr-2" id="myBookingsButton">Min sida</button>
        </router-link>
        <router-link to="/">
          <button type="button" class="btn btn-info border" id="logoutButton">Logga ut</button>
        </router-link>
      </div>
      <div v-else class="align-self-center">
        <router-link to="/register">
          <button type="button" class="btn btn-info border mr-2" id="regButton">
            Registrera
          </button>
        </router-link>
        <router-link to="/login">
          <button type="button" class="btn btn-info border" id="loginButton">
            Logga in
          </button>
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
              <p style="font-size:18px;margin:0">
                {{ room.countryName + " - " + room.cityName }}
              </p>
              <p style="font-size:18px;margin:0">
                {{ room.pricePerNight }} kr per natt
              </p>
              <p style="font-size:18px;margin:0">
                {{ room.kmToCenter }} km till centrum
              </p>
              <p style="font-size:18px;margin:0">
                {{ room.kmToBeach }} km till stranden
              </p>
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
                  <p style="font-size:16px;margin:0">
                    {{ reservation.checkIn }}
                  </p>
                  <br />
                </div>
                <div class="col-6">
                  <p style="font-size:16px;margin:0">
                    <b>Check-out:</b>
                  </p>
                  <p style="font-size:16px;margin:0">
                    {{ reservation.checkOut }}
                  </p>
                  <br />
                </div>
                <div class="col-6">
                  <p style="font-size:16px;margin:0">
                    <b>Antal vuxna:</b>
                  </p>
                  <p style="font-size:16px;margin:0">
                    {{ reservation.numAdults }}
                  </p>
                  <br />
                </div>
                <div class="col-6">
                  <p style="font-size:16px;margin:0">
                    <b>Antal barn:</b>
                  </p>
                  <p
                    style="font-size:16px;margin:0"
                    v-if="reservation.numKids > 0"
                  >
                    {{ reservation.numKids }} (3-18 år)
                  </p>
                  <p
                    style="font-size:16px;margin:0"
                    v-if="reservation.numSmallKids > 0"
                  >
                    {{ reservation.numSmallKids }} (0-2 år)
                  </p>
                  <br />
                </div>
              </div>

              <p style="font-size:18px;margin:0">
                <b>Totalpris:</b>
              </p>
              <p style="font-size:18px;margin:0">{{ totalPrice }}:-</p>
              <br />
              <p style="font-size:16px;margin:0">
                <b>Tillägg:</b>
              </p>
              <p style="font-size:16px;margin:0" v-if="addition1 !== ''">
                {{ addition1 }}: {{ addComma(boardPrice) }}:- pp/natt 
                ({{ addComma(totalBoardPrice) }}:- av totalpriset)
                <br />
              </p>
              <p style="font-size:16px;margin:0" v-if="addition2 !== ''">
                {{ addition2 }}, {{ extraBedPrice }}:-
              </p>
              <br />
            </div>
            <div class="col-sm-12 col-md-6">
              <img
                :src="getImageUrl(room.imgLink)"
                class="image my-3 rounded"
              />
            </div>
          </div>
        </div>
      </div>

      <div class="row m-1">
        <div class="col-sm-12 col-6">
          <div class="form-group">
            <label for="board">Välj tillägg:</label>
            <select
              class="form-control"
              id="board"
              v-model="board"
              @change="updateTotalPrice()"
            >
              <option value="NONE">Inget</option>
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
              v-model="extraBed"
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
            >
              Tillbaka
            </button>
          </router-link>
        </div>

        <div class="col-2 text-right">
          <button class="btn btn-info" @click="completeReservation()">
            Boka
          </button>
        </div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      addition1: "",
      addition2: "",
      numNights: "",
      extraBedPrice: "",
      boardPrice: "",
      totalPrice: "",
      totalBoardPrice: 0,
    };
  },
  created() {
    this.$store.dispatch("loadRooms");
    this.getNumberOfNights();
    this.setRoomId();
    this.getTotalPrice();
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
    },
    extraBed: {
      get() {
        return this.$store.state.home.reservation.extraBed;
      },
      set(n) {
        this.$store.commit("updateExtraBed", n);
        this.updateBedPrice();
      },
    },
    board: {
      get() {
        return this.$store.state.home.reservation.board;
      },
      set(value) {
        this.$store.commit("updateBoard", value);
        this.boardPrice = this.updateBoardPrice(value);
        if (value == "NONE") {
          this.addition1 = "";
        }
        console.log("board price ", this.boardPrice);
      },
    },
  },
  methods: {
    logout() {
      this.$store.dispatch('logout')
    },
    getImageUrl: function(file) {
      return require("../assets/images/" + file);
    },
    getNumberOfNights: function() {
      let reservation = this.$store.state.home.reservation;
      let date1 = new Date(reservation.checkIn);
      var date2 = new Date(reservation.checkOut);
      var timeDiff = Math.abs(date2.getTime() - date1.getTime());
      return (this.numNights = Math.ceil(timeDiff / (1000 * 3600 * 24)));
    },
    setRoomId() {
      this.$store.commit("updateRoom", this.room.roomId);
    },
    getTotalPrice() {
      let price = this.numNights * this.room.pricePerNight;
      this.totalPrice = this.addComma(price);
      console.log("total price ", this.totalPrice);
    },
    updateBoardPrice(value) {
      if (value == "HB") {
        this.addition1 = "Halvpension";
        return this.room.hbPrice;
      } else if (value == "FB") {
        this.addition1 = "Helpension";
        return this.room.fbPrice;
      } else if (value == "AI") {
        this.addition1 = "All Inclusive";
        return this.room.aiPrice;
      } else return 0;
    },
    updateBedPrice() {
      if (this.reservation.extraBed == 1) {
        this.addition2 = "Extra säng";
      } else this.addition2 = "";
      this.extraBedPrice = this.room.extraBedPrice;
      console.log("price extra bed ", this.extraBedPrice);
    },
    updateTotalPrice() {
      let numberOfPpl =
        parseInt(this.reservation.numAdults) +
        parseInt(this.reservation.numKids);

      this.totalBoardPrice = numberOfPpl * this.boardPrice * this.numNights;

      if (this.$store.state.home.reservation.extraBed == 0) {
        this.extraBedPrice = 0;
      }

      let price = this.numNights * this.room.pricePerNight;
      let finalPrice = price + this.totalBoardPrice + this.extraBedPrice;
      this.totalPrice = this.addComma(finalPrice);
      this.$store.commit("updateRoomPrice", finalPrice);
    },
    addComma: function(n) {
      let regex = /(\d+)(\d{3})/;
      return String(n).replace(/^\d+/, function(num) {
        while (regex.test(num)) {
          num = num.replace(regex, "$1,$2");
        }
        return num;
      });
    },
    completeReservation: async function() {
      let reservedRoom = this.$store.state.home.reservation;
      console.log("reservation submitted", reservedRoom);

      const url = "http://localhost:8080/reservedroom";
      const result = await fetch(url, {
        method: "POST",
        body: JSON.stringify(reservedRoom),
        headers: {
          "Content-Type": "application/json",
        },
      });
      if (result.ok) {
        console.log("post ok reservedRoom: " + reservedRoom.bookingNr + " ");
        window.confirm("Grattis! du har bokat en härlig hotellvistelse!");
      }
    },
  },
};
</script>

<style scoped>
.image {
  width: 100%;
  height: 80%;
}
</style>
