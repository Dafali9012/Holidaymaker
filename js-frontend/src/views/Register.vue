<template>
  <div class="d-flex flex-column align-items-center register">
    <div class="d-flex justify-content-between col-6 border rounded py-3 pl-5 text-left">
      <h2>Bachman Hendricks</h2>
      <div>
        <button type="button" class="btn btn-light border disabled">Registrera</button>
        <router-link to="/login">
          <button type="button" class="btn btn-light border">Logga in</button>
        </router-link>
      </div>
    </div>
    <form @submit.prevent="completeRegistration()" class="col-6 border rounded py-3 pl-5 text-left">
      <p class="font-weight-bold">Registrera konto</p>
      <input v-model="this.email" type="text" class="form-control col-4 mb-2" placeholder="Email" required />
      <input v-model="this.password" type="text" class="form-control col-4 mb-2" placeholder="Lösenord" required />
      <input v-model="this.name" type="text" class="form-control col-4 mb-2" placeholder="Namn" required />
      <input v-model="this.phone" type="text" class="form-control col-4 mb-2" placeholder="Telefon" required />
      <button type="submit" class="btn btn-light border">Registrera</button>
    </form>
  </div>
</template>

<script>
export default {
  data() {
    return {
      email: '',
      password: '',
      name: '',
      phone: ''
    };
  },
  methods: {
    completeRegistration: async function() {
      console.log("form submitted\nuser created");
      const newUser = { email: this.email,
                        password: this.password,
                        name: this.name,
                        phone: this.phone };
      const url = "http://localhost:8080/user";
      const result = await fetch(url, {
        method: "POST",
        body: JSON.stringify(newUser),
        headers: {
          "Content-Type": "application/json"
        }
      });
      if(result.ok) {
        console.log("post ok\nname: "+newUser.name)
      }
    }
  }
};
</script>