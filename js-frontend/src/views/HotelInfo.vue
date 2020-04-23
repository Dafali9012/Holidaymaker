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
        <div class="col-9 border rounded py-3 text-left">
          <div class="row">
            <div class="col bookingContent">
              <!--
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
              -->
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
      roomInfo: {
        /*
        hotel_name: this.hotel_name,
        country_name: this.country_name,
        checkIn: this.checkIn,
        checkOut: this.checkOut,
        adults: this.adults,
        children: this.children,
        smallChildren: this.smallChildren,
        numberOfRooms: this.numberOfRooms,
        total_price: this.total_price,
        bookingID: this.bookingID
        */
      }
    };
  },
  methods: {
    reserveRoom: async function() {
      let roomInfo = this.$store.dispatch("getReservedRoom");

      const url = "http://localhost:8080/reservedRoom";
      const result = await fetch(url, {
        method: "POST",
        body: JSON.stringify(roomInfo),
        headers: {
          "Content-Type": "application/json"
        }
      });
      if (result.ok) {
        console.log("post ok\nname: " + roomInfo.bookingID, roomInfo.username);
        window.confirm(
          "Du har bokat ett rum på" +
            roomInfo.hotel_name +
            "i " +
            roomInfo.country_name
        );
      }
    }
  }
};
</script>