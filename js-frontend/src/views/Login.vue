<template>
  <div class="container d-flex flex-column align-items-center Login py-5">
    <div class="d-flex justify-content-between col border rounded py-3 pl-5 text-left">
      <router-link to="/"><button class="btn btn-info"><h2>Bachman Hendricks</h2></button></router-link>
      <div class="align-self-center">
        <router-link to="/register">
          <button type="button" class="btn btn-light border">Registrera</button>
        </router-link>
        <button type="button" class="btn btn-light border disabled">Logga in</button>
      </div>
    </div>
    <form class="col border rounded py-3 pl-5 text-left">
      <p class="font-weight-bold">Logga in</p>
      <input type="text" class="form-control col-4 mb-2" placeholder="Username" required />
      <input type="password" class="form-control col-4 mb-2" placeholder="Password" required />
      <button type="submit" class="btn btn-light border">Logga in</button>
    </form>
  </div>
</template>