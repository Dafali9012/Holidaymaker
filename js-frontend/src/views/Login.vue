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
    <form @submit="customLogin" class="col-6 border rounded py-3 pl-5 text-left">
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
  async customLogin(e) {
    console.log('Login ok')
    e.preventDefault()

  /*const credentials = {

    username: 'yo',
    password: 'yo'
  } */
  const formData = new FormData();
formData.append('username', 'yo');
formData.append('password', 'yo');

/*fetch('/login',
    {
        body: formData,
        method: "post"
    });*/

  let response = await fetch("http://localhost:8080/login", {
    method: "POST",
   // headers: { "Content-Type": "application/json" },
  //  body: JSON.stringify(credentials)
  body: formData
  });

  try {
    response = await response.json()
    console.log(response);
  } catch {
    console.log('Wrong username/password');

  }

}
}
};
</script>
