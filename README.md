# Holidaymaker

# URL to use
http://localhost:8080/
username: root
pasword: 

#REST/API spec

🗸 user/all - hämta alla users

user/ POST - skapa en user (endast email och lösenord krävs, men fullName,adress,phonenumber ska man kunna ange)

🗸 user/{id} - hämta en specifik user med id. Id anges endast som en siffra, ex: localhost:8080/user/1

user/:id PUT - ändra data på en user med id


🗸 country/all - hämta ut alla länder

🗸 country/{id} - hämta ett specifik land med id. Id anges endast som en siffra, ex: localhost:8080/country/1

city/ GET - hämta ut alla städer

city/:countryId GET - hämta ut alla städer i ett land med id på land

hotel/ GET - hämta ut alla hotell

hotel/:countryId GET - hämta ut alla hotell i ett land med id på land

hotel/countryId:/:cityId GET - hämta ut alla hotell i en stad i ett land med id på stad

🗸 room/all - hämta alla rum

room/:hotelId GET - hämta alla LEDIGA rum på ett hotell med hotell id

reservation/:userid GET - hämta en bokning med id på user

reservation/ POST - skapa en bokning

reservation/:bookingId PUT - ändra info i en bokning med id på bokning

reservation/:bookingId DELETE - ta bort en bokning med id på bokning
