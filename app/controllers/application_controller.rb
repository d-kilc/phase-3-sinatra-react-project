class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # return ALL trips
  # get '/trips' do
  #   Trip.all.to_json
  # end

  #placeholder- get dummy user and trips and segments
  get '/users' do
    User.first.to_json
  end
  
  #returns all user's trips and segments
  get "/trips/:id" do
    current_user_id = params[:id]
    user_trips = User.find(current_user_id).user_trips
    user_trips.to_json(
      include: {
        trip: {include: :segments}
      }
    )
    # Clinic.all.to_json(
    #   only: [:clinic_name],
    #   include: { 
    #       patients: {only: [:name, :species]}
    #   } 
  end

  # save trip -> create trip, usertrip, and segment records for new trip
  # posts a trip and segments to user's profile
  post '/trips' do
    new_trip = Trip.create(description: params[:tripName])
    new_user_trip = UserTrip.create(user_id: params[:user_id], trip_id: new_trip.id, role: 'creator')

    params[:segments].each do |segment|
      Segment.create(from: segment[:from], to: segment[:to], date: segment[:date], trip_id: new_trip.id)
    end

    #return all user's trips and segments after post
    new_trip.to_json(include: :segments)
  end

  # get all users for a trip
  get '/trips/:id/users' do
    trip_id = params[:id]
    Trip.find(trip_id).users.to_json
  end

  # patch segment
  patch '/segments/:id' do
    segment_id = params[:id]
    segment = Segment.find(segment_id)
    
    segment.from = params[:from]
    segment.to = params[:to]
    segment.date = params[:date]

    segment.save
    segment.to_json
  end

  # delete segment
  delete '/segments/:id' do
    segment_id = params[:id]
    segment = Segment.find(segment_id)

    segment.destroy
  end

  # function updateTrip(key, value, segmentId, tripId) {
  #   fetch(`http://localhost:9292/trips/${tripId}`, {
  #     method: 'PATCH',
  #     headers: {"Content-Type": "application/json", Accept: "application/json"},
  #     body: JSON.stringify({
  #       trip_id: tripId,
  #       segment_id: segmentId,
  #       [key]: value,
  #     })
  #   })

end