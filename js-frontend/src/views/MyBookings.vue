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
        <div class="container border rounded py-3 text-left">
            <div class="row">
           <div class="col bookingContent">
               <p> BokingsNR: {{reservations[0]}}</p>  
              
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
      reservations: [],
    };
    },
    created: function(){
      // let currentUser = 5;
      this.getUserReservations()
    },
    methods: {
    getUserReservations: async function () {
      console.log('Loading method reservation')
      let url = "http://localhost:8080/reservation";
      const result = await fetch(url);
      this.reservations = await result.json();
      console.log(this.reservations)
    }
    }
}
</script>
