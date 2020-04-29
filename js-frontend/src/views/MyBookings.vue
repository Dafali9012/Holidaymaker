<template>
  <div class="container d-flex flex-column align-items-center py-5 rounded">
    <div class="d-flex justify-content-between col border rounded py-3 pl-5 text-left bg-light">
            <router-link to="/">
        <button class="btn btn-info" id="homeButton">
          <h2>Bachman Hendricks</h2>
        </button>
      </router-link>
      <div class="align-self-center">
          <button type="button" class="disabled btn btn-info border mr-2" id="myBookingsButton">Min sida</button>
        <a href="http://localhost:8080/logout">
          <button type="button" class="btn btn-info border" id="logoutButton">Logga ut</button>
        </a>
      </div>
    </div>
    <div class="container border rounded py-3 text-left bg-light">
      <div class="row ml-2 mt-2">
      <p class="font-weight-bold">Mina bokningar</p>
      </div>
    <div class="row">
      <div class="col ml-2 mt-0">Du har bokat följande:</div>
      </div>
        <div class="container border rounded py-3 text-left allBookings">
            <div v-for="booking in reservationsByCurrentUser" :key="booking.message">
              <div class="row singleBooking mt-3 border-bottom">
              <div class="col-9">
              <p><strong>Bokningsnummer:</strong> {{booking.bookingNr}}</p>
              <p><strong>Rumsnummer:</strong> {{booking.room}}</p>
              <p><strong>Antal vuxna:</strong> {{booking.numAdults}}</p>
              <p><strong>Antal barn:</strong> {{booking.numKids}}</p>
              <p><strong>Check In:</strong> {{booking.checkIn}}</p>
              <p><strong>Check Out:</strong> {{booking.checkOut}}</p>
              <p><strong>Tillägg:</strong> {{booking.board}}</p>
              <p><strong>Extrasäng:</strong> {{booking.extraBed}}</p>
              <p><strong>Pris:</strong> {{booking.totalRoomPrice}}</p>
              </div>
              <div class="col-3">
              <button type="button" class="disabled btn btn-info border mr-2" id="editBooking">Ändra</button>
              <button type="button" class="btn btn-info border" id="cancelBooking" v-on:click="deleteReservation(booking.bookingNr)">Avboka</button>
              </div>
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
      reservationsByCurrentUser: [],
    }
    },
    created: function(){
      this.getUserReservations();

    },    
    methods: {
      logout() {
      this.$store.dispatch('logout')
    },
    getUserReservations: async function () {
      let url = "http://localhost:8080/reservedroom";
      const result = await fetch(url);
      this.reservations = await result.json();
      let userResponse = await fetch("login/name")
      let userResult = await userResponse.json()
      const currentUser = userResult.userId 
      this.reservations.forEach(element => {
        if (currentUser == element.user){         
          this.reservationsByCurrentUser.push(element)
        }
      });
      console.log(this.reservations)
      console.log(this.reservationsByCurrentUser)
    },      
    deleteReservation: async function(bookingId) {
      console.log("deleteReservation() called");
      const reservationToDelete = bookingId;
      const url = "http://localhost:8080/reservedroom/"+reservationToDelete;
      console.log(reservationToDelete, "will be deleted")
      if (reservationToDelete){
      const result = await fetch(url, { method: "DELETE"});
      window.confirm("Din bokning med bokningsnummer: " + reservationToDelete + " har avbokats.")
      console.log(result)
      this.$router.go()
      }
    }
}
}
</script>
