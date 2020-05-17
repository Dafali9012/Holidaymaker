import { shallowMount } from '@vue/test-utils'
import Home from '@/views/Home.vue'
import store from '@/store/index.js'

describe('Home', () => {
    const wrapper = shallowMount(Home, { store })
    test('is a Vue instance', () => {

        expect(wrapper.isVueInstance()).toBeTruthy()
    }),
    test('contains the text', () => {
        //console.log(wrapper.text())
        expect(wrapper.text().includes('Bachman Hendricks')).toBe(true)
    }),
    test('Room type Double returns number 2', () => {
        //console.log(wrapper.text())
        expect(wrapper.vm.returnCapacity("DOUBLE")).toBe(2)
    }),
    test('Room type Single returns number 1', () => {
        //console.log(wrapper.text())
        expect(wrapper.vm.returnCapacity("SINGLE")).toBe(1)
    })

})
