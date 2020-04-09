<template>
  <div class="d-flex flex-column align-items-center Login">
    <div class="d-flex justify-content-between col-6 border rounded py-3 pl-5 text-left">
      <h2>Bachman Hendricks</h2>
      <div>
        <router-link to="/register">
          <button type="button" class="btn btn-light border">Registrera</button>
        </router-link>
        <button type="button" class="btn btn-light border rounded-0">Logga in</button>
      </div>
    </div>
    <form class="col-6 border rounded py-3 pl-5 text-left">
      <p class="font-weight-bold">Login</p>
      <input type="text" class="form-control col-4 mb-2" placeholder="User name" required />
      <input type="text" class="form-control col-4 mb-2" placeholder="Password" required />
      <button type="submit" class="btn btn-light border">Login</button>
    </form>
  </div>
</template>