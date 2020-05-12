import { enableFetchMocks } from 'jest-fetch-mock'
enableFetchMocks()

import store from '@/store/index.js'
import { mount } from '@vue/test-utils'
import Register from '@/views/Register.vue'


describe('Register', () => {
    const wrapper = mount(Register, {store})
    
    test('is a Vue instance', () => {
      
      
      expect(wrapper.isVueInstance()).toBeTruthy()
    })
    console.log('titta här', wrapper.vm.email)
    test('is a Vue instance', async () => {
      wrapper.vm.email = "pappa"
      wrapper.vm.password = "pappa"
      wrapper.vm.name = "pappa"
      wrapper.vm.phonenumber = "0101010101"
      wrapper.vm.address = ""

      let expectedData = {
        email: "pappa",
        password: "pappa",
        name: "pappa",
        phonenumber: "0101010101",
        address: ""
      }
        expect(wrapper.vm.$data).toEqual(expectedData)
      })
  })