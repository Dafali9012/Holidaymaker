Feature: Booking and deleting bookings

Background:
Given that i am on the Holidaymaker site
And that i am logged in

Scenario: making a booking
Given that i enter search data
And press search
And click on a room
When i press the booking button
Then i should have a booking