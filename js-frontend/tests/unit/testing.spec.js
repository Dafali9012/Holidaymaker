import { mount } from '@vue/test-utils'
import HotelInfo from '@/views/HotelInfo.vue'


describe('HotelInfo', () => {
    const wrapper = mount(HotelInfo)
    test('is a Vue instance', () => {
      
      expect(wrapper.isVueInstance()).toBeTruthy()
    })
  })