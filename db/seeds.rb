puts "🌱 Seeding spices..."

# Seed your database here
dan = User.create(username: "dkilcull")
friend = User.create(username: "john")
friend = User.create(username: "suzie")
friend = User.create(username: "bill")

trip_a = Trip.create(description: 'Vacation')
trip_b = Trip.create(description: 'fun trip')

dan_trip_a = UserTrip.create(user_id: dan.id, trip_id: trip_a.id, role: 'creator')
dan_trip_b = UserTrip.create(user_id: dan.id, trip_id: trip_b.id, role: 'creator')
friend_trip_a = UserTrip.create(user_id: friend.id, trip_id: trip_a.id, role: 'collaborator')

trip_a.segments << Segment.create(trip_id: trip_a.id, from: 'Chicago', to: 'Miami', date: '2022-02-21', method: 'plane')
trip_a.segments << Segment.create(trip_id: trip_a.id, from: 'Miami', to: 'Bahamas', date: '2022-02-25', method: 'plane')
trip_a.segments << Segment.create(trip_id: trip_a.id, from: 'Bahams', to: 'Chicago', date: '2022-03-16', method: 'plane')

trip_b.segments << Segment.create(trip_id: trip_b.id, from: 'New York', to: 'Boston', date: '2022-02-24', method: 'plane')
trip_b.segments << Segment.create(trip_id: trip_b.id, from: 'Boston', to: 'Philadelphia', date: '2022-03-13', method: 'plane')
trip_b.segments << Segment.create(trip_id: trip_b.id, from: 'Philadelphia', to: 'DC', date: '2022-03-25', method: 'plane')
trip_b.segments << Segment.create(trip_id: trip_b.id, from: 'DC', to: 'Baltimore', date: '2022-04-01', method: 'plane')

puts "✅ Done seeding!"
