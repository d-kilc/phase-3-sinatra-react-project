puts "🌱 Seeding spices..."

# Seed your database here
dan = User.create(username: "dkilcull")

dan.trips << Trip.create(user_id: dan.id, description: 'bachelors party')
dan.trips << Trip.create(user_id: dan.id, description: 'vacation')

dan_trip_a = dan.trips.first
dan_trip_b = dan.trips.second

dan_trip_a.segments << Segment.create(trip_id: dan_trip_a.id, from: 'Chicago', to: 'Milwaukee', date: '2/13/2022')
dan_trip_a.segments << Segment.create(trip_id: dan_trip_a.id, from: 'Milwaukee', to: 'Madison', date: '2/14/2022')
dan_trip_a.segments << Segment.create(trip_id: dan_trip_a.id, from: 'Madison', to: 'St. Louis', date: '2/15/2022')
dan_trip_a.segments << Segment.create(trip_id: dan_trip_a.id, from: 'St. Louis', to: 'Kansas City', date: '2/18/2022')

dan_trip_b.segments << Segment.create(trip_id: dan_trip_b.id, from: 'New York', to: 'Boston', date: '2/13/2022')
dan_trip_b.segments << Segment.create(trip_id: dan_trip_b.id, from: 'Boston', to: 'Philadelphia', date: '2/14/2022')
dan_trip_b.segments << Segment.create(trip_id: dan_trip_b.id, from: 'Philadelphia', to: 'DC', date: '2/15/2022')
dan_trip_b.segments << Segment.create(trip_id: dan_trip_b.id, from: 'DC', to: 'Baltimore', date: '2/18/2022')

puts "✅ Done seeding!"
