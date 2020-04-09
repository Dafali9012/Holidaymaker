<template>
  <div class="d-flex flex-column align-items-center register">
    <div class="d-flex justify-content-between col-6 border rounded py-3 pl-5 text-left">
      <h2>Bachman Hendricks</h2>
      <div>
        <router-link to="/register">
          <button type="button" class="btn btn-light border disabled">Registrera</button>
        </router-link>
        <router-link to="/login">
        <button type="button" class="btn btn-light border rounded-0">Logga in</button>
        </router-link>
      </div>
    </div>
    <form class="col-6 border rounded py-3 pl-5 text-left">
      <p class="font-weight-bold">Registrera konto</p>
      <input type="text" class="form-control col-4 mb-2" placeholder="Email" required />
      <input type="text" class="form-control col-4 mb-2" placeholder="Lösenord" required />
      <input type="text" class="form-control col-4 mb-2" placeholder="Namn" required />
      <input type="text" class="form-control col-4 mb-2" placeholder="Telefon" required />
      <button type="submit" class="btn btn-light border" onsubmit="submitForm()">Registrera</button>
    </form>
  </div>
</template>

<script>
export default {
    data() {
        return {
            //variables
        }
    },
    methods: {
        submitForm() {
            console.log("form submitted")
        }
    }
}
</script>