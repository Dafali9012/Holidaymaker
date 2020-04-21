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
    async loadSearchDataInfo({commit}) {
      let response = await fetch("http://localhost:8080/roominfo");
      let data = await response.json();
      commit('changeSearchData', data)
    },
    filterByCountry({commit}, param) {
      let country = param[1]
      let data = param[0].filter(item => {
        return item.countryName == country
      })
      console.log(data, country)
      commit('changeSearchData', data)
    }
  },
  modules: {
  }
})
