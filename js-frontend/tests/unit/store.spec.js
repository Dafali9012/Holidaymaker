import { enableFetchMocks } from 'jest-fetch-mock'
enableFetchMocks()

import store from '@/store/index.js'

  describe('Login', ()=>{

    let credentials = {"email":"usch","password":"hej"}
    let expectedUserData = {"userId":10,"email":"usch","password":"$2a$10$yRessZbpAaZsv/CabmRXwuHwnd8Iy3ChDNnbEdKHF/jt17o9Wf2Xq","fullName":"","address":"","phoneNumber":""}
  
    test('store login', async ()=>{
        expect(store.state.loggedInUser).toStrictEqual({})
      fetch.mockResponseOnce(JSON.stringify(expectedUserData))
      await store.dispatch('updateLoggedUser', credentials)
      //expectedUserData.adress = {}
      expect(store.state.loggedInUser).toEqual(expectedUserData)
    })
})

describe('booking', ()=>{

    let credentials = {
        board: "NONE",
        extraBed: 0,
        room: 8,
        user: 10,
        numAdults: 1,
        numKids: 0,
        numSmallKids: 0,
        checkIn: "2020-05-15",
        checkOut: "2020-05-16",
        totalRoomPrice: 1300
      }
    let expectedUserData = {board: "NONE",
    extraBed: 0,
    room: 8,
    user: 10,
    numAdults: 1,
    numKids: 0,
    numSmallKids: 0,
    checkIn: "2020-05-15",
    checkOut: "2020-05-16",
    totalRoomPrice: 1300}
  
    test('store booking', async ()=>{
        expect(store.state.roomReservation).toStrictEqual({})
      fetch.mockResponseOnce(JSON.stringify(expectedUserData))
      await store.commit('changeRoomReservation', credentials)
      expect(store.state.roomReservation).toEqual(expectedUserData)
    })
})