<template>
  <div class="container d-flex flex-column align-items-center py-5 rounded">
    <div class="d-flex justify-content-between col border rounded py-3 pl-5 text-left bg-light">
            <router-link to="/">
        <button class="btn btn-info" id="homeButton">
          <h2>Bachman Hendricks</h2>
        </button>
      </router-link>
      <div>
        <router-link to="/register">
          <button type="button" class="btn btn-info border mr-2" id="regButton">Registrera</button>
        </router-link>
        <router-link to="/login">
          <button type="button" class="btn btn-info border" id="loginButton">Logga in</button>
        </router-link>
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
          <div class="row singleBooking">
           <div class="col-9">
               <p><strong>Bokningsnummer:</strong> {{reservationsByCurrentUser[0].bookingNumber}}</p>
               <p><strong>Antal rum:</strong> {{reservationsByCurrentUser[0].numberOfRooms}}</p>
               <p><strong>Check in:</strong> {{reservationsByCurrentUser[0].checkIn}}</p>
               <p><strong>Check out:</strong> {{reservationsByCurrentUser[0].checkOut}}</p>
               <p><strong>Pris:</strong> {{reservationsByCurrentUser[0].totalPrice+":-"}}</p>
               </div>
               <div class="col-3">
               <button type="button" class="btn btn-info border mr-2" id="editBooking">Ändra</button>
               <button type="button" class="btn btn-info border" id="cancelBooking">Avboka</button>
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
      index: 0,
      target: document.querySelector("allBookings singleBooking"),
      content: `<div class='col-9'>
               <p><strong>Bokningsnummer:</strong> {{reservationsByCurrentUser[index].bookingNumber}}</p>
               <p><strong>Antal rum:</strong> {{reservationsByCurrentUser[index].numberOfRooms}}</p>
               <p><strong>Check in:</strong> {{reservationsByCurrentUser[index].checkIn}}</p>
               <p><strong>Check out:</strong> {{reservationsByCurrentUser[index].checkOut}}</p>
               <p><strong>Pris:</strong> {{reservationsByCurrentUser[index].totalPrice+":-"}}</p>
               </div>
               <div class="col-3">
               <button type="button" class="btn btn-info border mr-2" id="editBooking">Ändra</button>
               <button type="button" class="btn btn-info border" id="cancelBooking">Avboka</button>
               </div>
            </div>`
    };
    },
    created: function(){
      this.getUserReservations();
      this.generateContent();

    },    
    methods: {
    getUserReservations: async function () {
      let url = "http://localhost:8080/reservation";
      const result = await fetch(url);
      this.reservations = await result.json();
      const currentUser = 5; //Ändra till önskat userId
      this.reservations.forEach(element => {
        if (currentUser == element.userId){         
          this.reservationsByCurrentUser.push(element)
        }
      });
      console.log(this.reservations)
      console.log(this.reservations[0].userId)
      console.log(this.reservationsByCurrentUser)
    },
    generateContent: function(reservationsByCurrentUser, target, content, index){
        target.insertAdjacentHTML("beforeend", content.replace(/~id~/g, reservationsByCurrentUser));
        index++;
        console.log(index)
    }
}
}
</script>
