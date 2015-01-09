# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#clients
Client.create(first_name: 'Garth', last_name: 'Gaughan', phone: '987654321', email: 'garth@tm.com', password: '12345678')
Client.create(first_name: 'Charlie', last_name: 'Sampson', phone: '123654321', email: 'charlie@tm.com', password: '12345678')


#providers
Provider.create(first_name: 'Teresa', last_name: 'Greth', phone: '123456789', email: 'teresa@tm.com', password: '12345678')
Provider.create(first_name: 'Regina', last_name: 'Gutierrez', phone: '142537891', email: 'regina@tm.com', password: '12345678')

#messages
Message.create(subject: 'Client 1 Subject', body: 'Test 1 Body', sender_id: Client.first.id, receiver_id: Provider.first.id)
Message.create(subject: 'Client 2 Subject', body: 'Test 2 Body', sender_id: Client.first.id, receiver_id: Provider.last.id)
Message.create(subject: 'Client 3 Subject', body: 'Test 3 Body', sender_id: Client.last.id, receiver_id: Provider.first.id)
Message.create(subject: 'Client 4 Subject', body: 'Test 4 Body', sender_id: Client.last.id, receiver_id: Provider.last.id)

Message.create(subject: 'Provider 1 Subject', body: 'Test 1 Body', sender_id: Provider.first.id, receiver_id: Client.first.id)
Message.create(subject: 'Provider 2 Subject', body: 'Test 2 Body', sender_id: Provider.first.id, receiver_id: Client.last.id)
Message.create(subject: 'Provider 3 Subject', body: 'Test 3 Body', sender_id: Provider.last.id, receiver_id: Client.first.id)
Message.create(subject: 'Provider 4 Subject', body: 'Test 4 Body', sender_id: Provider.last.id, receiver_id: Client.last.id)

Message.create(subject: 'Client 1 Subject', body: 'Test 1 Body', sender_id: Client.first.id, receiver_id: Provider.first.id, archived: true)
Message.create(subject: 'Client 2 Subject', body: 'Test 2 Body', sender_id: Client.first.id, receiver_id: Provider.last.id, archived: true)
Message.create(subject: 'Client 3 Subject', body: 'Test 3 Body', sender_id: Client.last.id, receiver_id: Provider.first.id, archived: true)
Message.create(subject: 'Client 4 Subject', body: 'Test 4 Body', sender_id: Client.last.id, receiver_id: Provider.last.id, archived: true)

Message.create(subject: 'Provider 1 Subject', body: 'Test 1 Body', sender_id: Provider.first.id, receiver_id: Client.first.id, archived: true)
Message.create(subject: 'Provider 2 Subject', body: 'Test 2 Body', sender_id: Provider.first.id, receiver_id: Client.last.id, archived: true)
Message.create(subject: 'Provider 3 Subject', body: 'Test 3 Body', sender_id: Provider.last.id, receiver_id: Client.first.id, archived: true)
Message.create(subject: 'Provider 4 Subject', body: 'Test 4 Body', sender_id: Provider.last.id, receiver_id: Client.last.id, archived: true)