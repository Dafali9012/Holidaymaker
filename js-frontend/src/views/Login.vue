<template>
  <div class="d-flex flex-column align-items-center Login">
    <div class="d-flex justify-content-between col-6 border rounded py-3 pl-5 text-left">
      <h2>Bachman Hendricks</h2>
      <div>
        <router-link to="/register">
          <button type="button" class="btn btn-light border">Registrera</button>
        </router-link>
        <button type="button" class="btn btn-light border disabled">Logga in</button>
      </div>
    </div>
    <form @submit.prevent="springLogin" class="col-6 border rounded py-3 pl-5 text-left">
      <p class="font-weight-bold">Logga in</p>
      <input v-model="email" type="text" class="form-control col-4 mb-2" placeholder="email" required />
      <input v-model="password" type="password" class="form-control col-4 mb-2" placeholder="Lösenord" required />
      <input  type="submit" class="btn btn-light border" value="Logga in" />
    </form>
  </div>
</template>


<script>
export default {
  data() {
    return {
      email: '',
      password: ''
     }
     },
      methods:{
   async springLogin() {
     console.log(this.email)
     console.log(this.password)
     console.log(this)




  const credentials = 'username=' +

    encodeURIComponent(this.email)

    + '&password=' +

    encodeURIComponent(this.password)


  let response = await fetch("http://localhost:8080/login", {

    method: "POST",
    redirect:"manual",

    headers: { "Content-Type": "application/x-www-form-urlencoded" },

    body: credentials

  });


  if(response.url.includes('error')) {

    console.log('Wrong username/password');

  }//else

}
     }
}
</script>
