import { enableFetchMocks } from 'jest-fetch-mock'
enableFetchMocks()

import store from '@/store/index.js'

describe('Login', ()=>{

  let credentials = {"email":"bob@node.se","password":"abc123"}
  let expectedUserData = {"id":2,"email":"bob@node.se","password":"abc123","first_name":"Bob","last_name":"Node","loggedIn":true}

  test('store login', async ()=>{
    fetch.mockResponseOnce(JSON.stringify(expectedUserData))
    await store.dispatch('login', credentials)
    expectedUserData.adress = {}
    expect(store.state.user).toEqual(expectedUserData)
  })

})