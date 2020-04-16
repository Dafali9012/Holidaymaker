<template>
  <div class="d-flex flex-column align-items-center Login">
    <div class="d-flex justify-content-between col-6 border rounded py-3 pl-5 text-left bg-light">
      <h2>Bachman Hendricks</h2>
      <div>
        <router-link to="/register">
          <button type="button" class="btn btn-info border mr-2">Registrera</button>
        </router-link>
        <button type="button" class="btn btn-info border disabled">Logga in</button>
      </div>
    </div>
    <form class="col-6 border rounded py-3 pl-5 text-left bg-light p-0 rounded">
      <p class="font-weight-bold">Logga in</p>
      <div class="row d-flex mt-4">
      <input type="text" name="username" class="form-control col-4 pl-0 ml-3" placeholder=" " required />
      <label for="username" class="col-9 formlabel mt-2 ml-2">Username</label>
      </div>
      <div class="row d-flex mt-4">
      <input type="password" name="password" class="form-control col-4 ml-3" placeholder=" " required />
      <label for="password" class="col-9 formlabel mt-2 ml-2">Password</label>
      </div>
      <button type="submit" class="btn btn-info border mt-4">Logga in</button>
    </form>
  </div>
</template>