# pitzi
Pitzi - Ruby Coding Challenge

PROJECTS:
1-) ApiService - Web service to manager clients and orders
Gems:
Devise
Devise Simple Token
Rack Cors
Rack Attack

2-) OrderSystem - System with interface user to register clients and orders
------------------
Doc Postman API view:
Api.postman_collection.json
or
https://www.postman.com/marcomapa/workspace/pitzi/collection/16937606-a3195e82-f623-40b4-8e07-70462f2dbf69

------------------
User Api
mail: suporte@marcomapa.com
password: 123456
authentication_token: Y4M4b_XHVsMAFR7gQqwy

for generate new user run this:
User.create(email: 'your_mail@server.com', password: '123456')

Must send header params:
X-User-Email:suporte@marcomapa.com
X-User-Token:Y4M4b_XHVsMAFR7gQqwy
