# Holidaymaker

# URL to use
http://localhost:8080/
username: root
pasword: 

#REST/API spec

user/ GET - hämta alla users
user/ POST - skapa en user (endast email och lösenord krävs, men fullName,adress,phonenumber ska man kunna ange)
user/:id GET - hämta en specifik user med id
user/:id PUT - ändra data på en user med id

country/ GET - hämta ut alla länder

city/ GET - hämta ut alla städer
city/:countryId - hämta ut alla städer i ett land med id på land

hotels/ GET - hämta ut alla hotell
hotels/:countryId - hämta ut alla hotell i ett land med id på land
hotels/:cityId - hämta ut alla hotell i en stad med id på stad

room/ GET - hämta alla rum
room/:hotelId GET - hämta alla LEDIGA rum på ett hotell med hotell id

reservation/:userid GET - hämta en bokning med id på user
reservation/ - skapa en bokning
reservation/:bookingId PUT - ändra info i en bokning med id på bokning
reservation/:bookingId DELETE - ta bort en bokning med id på bokning
