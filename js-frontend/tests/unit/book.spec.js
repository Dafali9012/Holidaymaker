import { mount } from '@vue/test-utils'
import Room from '@/views/Room.vue'
import store from '@/store/index.js'

let roomReservation = { "room": "0", "totalRoomPrice": 800, "numKids": 0, "numAdults": 1 }
let room = { imgLink: "castillo/single.jpg" }



describe('Room', () => {
    console.log("before")
    store.roomReservation = roomReservation
    const wrapper = mount(Room, { propsData: { room: room }, store })
    test('is a Vue instance', () => {

        expect(wrapper.isVueInstance()).toBeTruthy()
    })

    test('contains the text', () => {

        expect(wrapper.name()).toBe('Foo')
        expect(wrapper.contains('Totalpris:')).toBe(true)
        expect(wrapper.contains('Välj tillägg:')).toBe(true)

    })

    test('contains the text', () => {

        const p = wrapper.find('Välj tillägg:')
        expect(p.name()).toBe('Välj tillägg:')

    })



})