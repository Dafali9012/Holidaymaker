<template>
  <div class="container d-flex flex-column align-items-center Login py-5">
    <div class="d-flex justify-content-between col border rounded py-3 pl-5 text-left bg-light">
      <router-link to="/">
        <button class="btn btn-info" id="homeButton">
          <h2>Bachman Hendricks</h2>
        </button>
      </router-link>
      <div class="align-self-center">
          <router-link to="/myBookings">
          <button type="button" class="btn btn-info border mr-2" id="myBookingsButton">Min sida</button>
        </router-link>
        <router-link to="/register">
          <button type="button" class="btn btn-info border mr-2" id="regButton">Registrera</button>
        </router-link>
        <button type="button" class="btn btn-info border disabled" id="loginButton">Logga in</button>
      </div>
    </div>

    <form
      @submit.prevent="springLogin"
      class="col border rounded py-3 pl-5 text-left bg-light p-0 rounded"
      autocomplete="off"
    >
      <p class="font-weight-bold">Logga in</p>
      <div class="row d-flex mt-4">
        <input
          v-model="email"
          type="text"
          name="email"
          class="form-control col-4 ml-3"
          placeholder=" "
          required
        />
        <label for="email" class="col-9 formlabel mt-2 ml-2">email</label>
      </div>
      <div class="row d-flex mt-4">
        <input
          v-model="password"
          type="password"
          name="password"
          class="form-control col-4 ml-3"
          placeholder=" "
          required
        />
        <label for="password" class="col-9 formlabel mt-2 ml-2">Password</label>
      </div>
      <button type="submit" class="btn btn-info border mt-4" id="submitButton">Logga in</button>
    </form>
  </div>
</template>


<script>
export default {
  data() {
    return {
      email: "",
      password: ""
    };
  },
  methods: {
    springLogin: async function() {
      const credentials =
        "username=" +
        encodeURIComponent(this.email) +
        "&password=" +
        encodeURIComponent(this.password);

      let response = await fetch("/rest/login", {
        method: "POST",
        redirect: "manual",
        headers: { "Content-Type": "application/x-www-form-urlencoded" },
        body: credentials
      });

      if (response.url.includes("error")) {
        window.confirm("Inloggningen misslyckades");
      } else {
        this.$store.dispatch('updateLoggedUser')
        this.$router.push("/");
      }
    }
  }
};
</script>
