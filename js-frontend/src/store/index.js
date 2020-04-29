import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

export default new Vuex.Store({
  state: {
    loggedInUser : {},
    home: {
      rooms: [],
      searchData: [],
      reservation: {
        bookingNr: '',
        roomId: '',
        user: 0,
        numAdults: 0,
        numKids: 0,
        numSmallKids: 0,
        checkIn: '',
        checkOut: '',
        board: '',
        extraBed: 0,
        totalRoomPrice: '',
      }
    },
  },
  mutations: {
    changeSearchData(state, value) {
      state.home.searchData = value
    },

    loadRooms(state, value) {
      state.home.rooms = value
    },
    changeReservationData(state, value) {
      state.home.reservation = value
    },
    updateExtraBed(state, n) {
      state.home.reservation.extraBed = n;
      console.log('extraBed ', n)
    },
    updateBoard(state, val) {
      state.home.reservation.board = val;
      console.log('board ', val)
    },
    updateRoom(state, val) {
      state.home.reservation.roomId = val;
      console.log('room ', val)
    },
    updateRoomPrice(state, val) {
      state.home.reservation.totalRoomPrice = val;
      console.log('total room pricee', val)
    },
    changeLoggedUser(state, value) {
      state.loggedInUser = value
    }
  },
  actions: {
    async loadSearchData({
      commit
    }, params) {
      let response = await fetch("http://localhost:8080/roominfo");
      let data = await response.json();

      //console.log(data)

      let reservedRoomsResponse = await fetch("http://localhost:8080/reservedroom");
      let reservedRoomsData = await reservedRoomsResponse.json();

      // country
      if (params[0] != "0") {
        data = data.filter(item => {
          return item.countryName == params[0]
        })
      }

      // daterange
      let selectedCheckIn = params[1][0].split("-")
      let selectedCheckOut = params[1][1].split("-")
      for (let reservedRoom of reservedRoomsData) {
        let roomCheckIn = reservedRoom.checkIn.split("-")
        let roomCheckOut = reservedRoom.checkOut.split("-")

        if (selectedCheckIn < roomCheckIn && selectedCheckOut > roomCheckOut) {
          data = data.filter(item => {
            return item.roomId != reservedRoom.room
          })
        }

        if (selectedCheckIn[2] >= roomCheckIn[2] &&
          selectedCheckIn[2] <= roomCheckOut[2]) {
          if (selectedCheckIn[1] == roomCheckIn[1] ||
            selectedCheckIn[1] == roomCheckOut[1]) {
            if (selectedCheckIn[0] == roomCheckIn[0] ||
              selectedCheckIn[0] == roomCheckOut[0]) {
              data = data.filter(item => {
                return item.roomId != reservedRoom.room
              })
            }
          }
        }

        if (selectedCheckOut[2] >= roomCheckIn[2] &&
          selectedCheckOut[2] <= roomCheckOut[2]) {
          if (selectedCheckOut[1] == roomCheckIn[1] ||
            selectedCheckOut[1] == roomCheckOut[1]) {
            if (selectedCheckOut[0] == roomCheckIn[0] ||
              selectedCheckOut[0] == roomCheckOut[0]) {
              data = data.filter(item => {
                return item.roomId != reservedRoom.room
              })
            }
          }
        }
      }

      // number of guests
      let numGuests = parseInt(params[2][0], 10) + parseInt(params[2][1], 10)
      if (numGuests > 4) {
        data = []
      } else if (numGuests > 2) {
        data = data.filter(item => {
          return (item.roomType == 'STUDIO')
        })
      } else if (numGuests == 2) {
        data = data.filter(item => {
          return (item.roomType != 'SINGLE')
        })
      }

      // amenities : pool - entertainment - bar - sauna
      //console.log(params[3][0]+" "+params[3][1]+" "+params[3][2]+" "+params[3][3])
      if(params[3][0]) {
        data = data.filter(item => {
          return (item.pool == 1)
        })
      }
      if(params[3][1]) {
        data = data.filter(item => {
          return (item.entertainment == 1)
        })
      }
      if(params[3][2]) {
        data = data.filter(item => {
          return (item.bar == 1)
        })
      }
      if(params[3][3]) {
        data = data.filter(item => {
          return (item.sauna == 1)
        })
      }

      // distances : center - beach
      if(params[5][0]!="") {
        data = data.filter(item => {
          return item.kmToCenter <= params[5][0]
        })
      }
      if(params[5][1]!="") {
         data = data.filter(item => {
          return item.kmToBeach <= params[5][1]
        })
      }

      // sorting
      if(params[4]=="price") {
        data.sort(function(a,b) {
          return a.pricePerNight-b.pricePerNight
        })
      } else if(params[4]=="rating") {
        data.sort(function(a,b) {
          return b.hotelRating-a.hotelRating
        })
      }

      commit('changeSearchData', data)
    },
    async loadRooms({ commit }) {
      let response = await fetch("http://localhost:8080/roominfo")
      let result = await response.json()
      commit('loadRooms', result)
    },
    reserveRoomData({ commit }, newRoomReservation) {
      commit('changeReservationData', newRoomReservation)
    },
    async updateLoggedUser({commit}) {
      let response = await fetch("login/name")
      let result = await response.json()
      commit('changeLoggedUser', result)
    }
  },
  
  modules: {}
})