<template>
  <div class="container align-items-center">
    <div class="d-flex justify-content-between col border rounded py-3 pl-5 text-left">
      <h2>Bachman Hendricks</h2>
      <div>
        <router-link to="/register">
          <button type="button" class="btn btn-light border">Registrera</button>
        </router-link>
                <router-link to="/login">
        <button type="button" class="btn btn-light border">Logga in</button>
                </router-link>
      </div>
    </div>
    <div class="container border rounded py-3 text-left">
      <div class="row ml-2 mt-2">
      <p class="font-weight-bold">Bokningsbekräftelse</p>
      </div>
    <div class="row">
      <div class="col ml-2 mt-0">Du har bokat följande:</div>
      </div>
        <div class="container border rounded py-3 text-left">
            <div class="row">
           <div class="col bookingContent">
               <p>Hotel: {{hotel_name}}</p>   
               <p>Land: {{country_name}}</p>   
               <p>Check In: {{checkIn}}</p>   
               <p>Check Out: {{checkOut}}</p>   
               <p>Antal vuxna: {{adults}}</p>    
               <p>Antal barn: {{children}}</p>
               <p>Antal småbarn: {{smallChildren}}</p>    
               <p>Antal rum: {{numberOfRooms}}</p>  
               <p>Pris: {{total_price}}</p> 
               <p>BokingsID: {{bookingID}}</p>                 
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
    hotel_name: this.hotel_name,
    country_name: this.country_name,
    checkIn: this.checkIn,
    checkOut: this.checkOut,
    adults: this.adults,
    children: this.children,
    smallChildren: this.smallChildren,
    numberOfRooms: this.numberOfRooms,
    total_price: this.total_price,
    bookingID: this.bookingID,
  }
}
}
</script>
