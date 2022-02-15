puts "🌱 Seeding spices..."

# Seed your database here
dan = User.create(username: "dkilcull")
friend = User.create(username: "pstar")
friend = User.create(username: "spongebob")
friend = User.create(username: "sandy_cheeks")

trip_a = Trip.create(description: 'Vacation')
trip_b = Trip.create(description: 'fun trip')

dan_trip_a = Usertrip.create(user_id: dan.id, trip_id: trip_a.id, role: 'creator')
dan_trip_b = Usertrip.create(user_id: dan.id, trip_id: trip_b.id, role: 'creator')
friend_trip_a = Usertrip.create(user_id: friend.id, trip_id: trip_a.id, role: 'collaborator')

trip_a.segments << Segment.create(trip_id: trip_a.id, from: 'Chicago', to: 'Miami', date: '2022-02-21', method: 'plane')
trip_a.segments << Segment.create(trip_id: trip_a.id, from: 'Miami', to: 'Turks', date: '2022-02-25', method: 'plane')
trip_a.segments << Segment.create(trip_id: trip_a.id, from: 'Turks', to: 'Bali', date: '2022-03-16', method: 'plane')
trip_a.segments << Segment.create(trip_id: trip_a.id, from: 'Bali', to: 'Chicago', date: '2022-03-20', method: 'plane')

trip_b.segments << Segment.create(trip_id: trip_b.id, from: 'New York', to: 'Boston', date: '2022-02-24', method: 'plane')
trip_b.segments << Segment.create(trip_id: trip_b.id, from: 'Boston', to: 'Philadelphia', date: '2022-03-13', method: 'plane')
trip_b.segments << Segment.create(trip_id: trip_b.id, from: 'Philadelphia', to: 'DC', date: '2022-03-25', method: 'plane')
trip_b.segments << Segment.create(trip_id: trip_b.id, from: 'DC', to: 'Baltimore', date: '2022-04-01', method: 'plane')

puts "✅ Done seeding!"
