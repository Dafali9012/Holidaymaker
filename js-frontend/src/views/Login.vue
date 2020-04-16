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
    <form @submit.prevent="userLogin()" class="col-6 border rounded py-3 pl-5 text-left">
      <p class="font-weight-bold">Logga in</p>
      <input v-model="email" type="text" class="form-control col-4 mb-2" placeholder="Email" required />
      <input v-model="password" type="password" class="form-control col-4 mb-2" placeholder="Lösenord" required />
      <button type="submit" class="btn btn-light border">Logga in</button>
    </form>
  </div>
</template>

<script>
function transformRequest(jsonData = {}){
  return Object.entries(jsonData)
    .map(x => `${encodeURIComponent(x[0])}=${encodeURIComponent(x[1])}`)
    .join('&');
}

export default {
  data() {
    return {
      email: '',
      password: '',
      methods:{
  async userLogin(){
  let email = 'user'
  let password = 'password'

  const credentials = 'username=' +
    encodeURIComponent(email)
    + '&password=' +
    encodeURIComponent(password)

  let response = await fetch("/login", {
    method: "POST",
    headers: { "Content-Type": "application/x-www-form-urlencoded" },
    body: credentials
  });

  if(response.url.includes('error')) {
    console.log('Wrong username/password');
  }
  }
}
}
}
}
</script>
// export default {
//   data() {
//     return {
//       email: '',
//       password: ''
//     };
//   },
//   methods: {
//     userLogin: async function() {
//     await fetch('/login', {
//         method: "POST",
//         body: transformRequest({email: "user", password: "password"}),
//         headers: { 'Content-Type': 'application/x-www-form-urlencoded' }
//       })
//     .then(function(response) {
//         let successfulLogin = !response.url.includes("error");
//         console.log("the login result is:", successfulLogin);
//       });
//     }
//   }
// };
