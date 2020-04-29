import store from '@/store/index.js'
import { mount } from '@vue/test-utils'
import Home from '@/views/Home.vue'



console.log('store: ', store)
describe('Home', () => {
    const wrapper = mount(Home, {store})
    
    test('is a Vue instance', () => {
      
      expect(wrapper.isVueInstance()).toBeTruthy()
    })
  })