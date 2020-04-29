<template>
  <div class="container d-flex flex-column align-items-center register py-5">
    <div class="d-flex justify-content-between col border rounded py-3 pl-5 text-left bg-light">
      <router-link to="/"><button class="btn btn-info" id="homeButton"><h2>Bachman Hendricks</h2></button></router-link>

      <div class="align-self-center">
        <button type="button" class="btn btn-info border disabled mr-2" id="regButton">Registrera</button>
        <router-link to="/login">
          <button type="button" class="btn btn-info border" id="loginButton">Logga in</button>
        </router-link>
      </div>
    </div>
    <form @submit.prevent="completeRegistration()" class="col border rounded py-3 pl-5 text-left bg-light p-0" autocomplete="off">
      <p class="font-weight-bold">Registrera konto</p>
      <div class="row d-flex mt-4">
      <input v-model="email" name="email" type="text" class="form-control col-4 ml-3" placeholder=" " required />
      <label for="email" class="col-9 mt-2 ml-2 formlabel">Email</label>
      </div>
      <div class="row d-flex mt-4">
      <input v-model="password" name="password" type="password" class="form-control col-4 ml-3" placeholder=" " required />
      <label for="password" class="col-9 mt-2 ml-2 formlabel">Lösenord</label>
      </div>
      <div class="row d-flex mt-4">
      <input v-model="name" type="text" name="name" class="form-control col-4 ml-3" placeholder=" " />
      <label for="name" class="col-9 mt-2 ml-2 formlabel">Namn</label>
      </div>
      <div class="row d-flex mt-4">
      <input v-model="phonenumber" name="phone" type="text" class="form-control col-4 ml-3" placeholder=" " />
      <label for="phone" class="col-9 mt-2 ml-2 formlabel">Telefonnummer</label>
      </div>
      <button type="submit" class="btn btn-info border mt-4" id="submitButton">Registrera</button>
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