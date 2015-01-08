# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#clients
User.create(first_name: 'Garth', last_name: 'Gaughan', phone: '987654321', email: 'garth@tm.com', type: 'Client', password: '12345678')
User.create(first_name: 'Charlie', last_name: 'Sampson', phone: '123654321', email: 'charlie@tm.com', type: 'Client', password: '12345678')


#providers
User.create(first_name: 'Teresa', last_name: 'Greth', phone: '123456789', email: 'teresa@tm.com', type: 'Provider', password: '12345678')
User.create(first_name: 'Regina', last_name: 'Gutierrez', phone: '142537891', email: 'regina@tm.com', type: 'Provider', password: '12345678')