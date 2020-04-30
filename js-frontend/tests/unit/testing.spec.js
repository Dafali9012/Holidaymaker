import store from '@/store/index.js'
import { mount } from '@vue/test-utils'
import Home from '@/views/Home.vue'



console.log('store: ', store)
describe('Home', () => {
    const wrapper = mount(Home, {store})

    let bla = document.getElementById("country").value
    
    test('is a Vue instance', () => {
      
      expect(wrapper.isVueInstance()).toBeTruthy()
    })
  })