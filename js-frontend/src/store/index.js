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
    filterSearch: function({commit}, state, filterBy) {
      console.log("comparing selected country: "+filterBy)
      let data = state.home.searchData.filter(item => {
        return item.countryName == filterBy
      })
      console.log("state: "+state)
      console.log("new list: "+data)
      commit('changeSearchData', data)
    }
  },
  modules: {
  }
})
