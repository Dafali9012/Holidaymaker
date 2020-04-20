import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    home: {
      searchData: []
    }
  },
  mutations: {
    changeSearchData(state, value) {
      state.home.searchData = value
    }
  },
  actions: {
    async loadSearchData({commit}) {
      let response = await fetch("http://localhost:8080/room/all");
      let data = await response.json();
      commit('changeSearchData', data)
    },
     async loadCountries({ commit }) {
      let response = await fetch("http://localhost:8080/country/all");
      let data = await response.json();
      commit('changeSearchData', data)
    },
  },
  modules: {
  }
})
