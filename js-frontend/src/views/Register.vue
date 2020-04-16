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
      <input v-model="email" type="text" class="form-control col-4 mb-2" placeholder="Email" required />
      <input v-model="password" type="password" class="form-control col-4 mb-2" placeholder="Lösenord" required />
      <input v-model="name" type="text" class="form-control col-4 mb-2" placeholder="Namn" />
      <input v-model="phonenumber" type="text" class="form-control col-4 mb-2" placeholder="Telefon" />
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
      phonenumber: '',
      address: ''
    };
  },
  methods: {
    completeRegistration: async function() {
      console.log("form submitted\nuser created");
      const newUser = { email: this.email,
                        password: this.password,
                        name: this.name,
                        phonenumber: this.phonenumber,
                        address: "-" };
      const url = "http://localhost:8080/user";
      const result = await fetch(url, {
        method: "POST",
        body: JSON.stringify(newUser),
        headers: {
          "Content-Type": "application/json"
        }
      });
      if(result.ok) {
        console.log("post ok\nname: "+newUser.name+" "+newUser.phonenumber)
        window.confirm("Hej "+ newUser.name + ", du har lyckats med registreringen!")
      
      }
    }
  }
};
</script>