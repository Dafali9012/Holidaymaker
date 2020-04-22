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
      console.log(state.home.searchData)
    }
  },
  actions: {
    async loadSearchData({commit}, country) {
      let response = await fetch("http://localhost:8080/roominfo");
      let data = await response.json();

      if (country != "0") {
          data = data.filter(item => {
          return item.countryName == country
        })
      }
      commit('changeSearchData', data)
    }
  },
  modules: {}
})