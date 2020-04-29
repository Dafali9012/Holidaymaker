import { mount } from '@vue/test-utils'
import Register from '@/views/Register.vue'


describe('Register', () => {
    const wrapper = mount(Register)
    
    test('is a Vue instance', () => {
      
      expect(wrapper.isVueInstance()).toBeTruthy()
    })
    console.log('titta här', wrapper.vm.data)
    test('is a Vue instance', () => {
      
        expect(wrapper.isVueInstance()).toBeTruthy()
      })
  })