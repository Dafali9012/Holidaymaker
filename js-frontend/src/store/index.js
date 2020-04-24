import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    user: {
      loggedIn: false
    }
  },
  mutations: {
    setUser(state, value) {
      state.user = value
    },
  },
  actions: {
    async login({
      commit
    }, credentials) {
      let response = await fetch('http://localhost:8080/login', {
        method: 'post',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(credentials)
      })
      let user = await response.json()
      commit('setUser', user)
    },
    async checkAuth({
      commit
    }) {
      let response = await fetch('http://localhost:8080/login')
      let user = await response.json()
      commit('setUser', user)
    },
  },
  modules: {}
})