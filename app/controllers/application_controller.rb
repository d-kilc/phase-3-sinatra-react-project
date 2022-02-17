class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  #placeholder- get dummy user and trips and segments
  get '/users' do
    User.first.to_json
  end
  
  #returns all user's trips and segments
  get "/users/:user_id/trips" do
    current_user_id = params[:user_id]
    user_trips = User.find(current_user_id).user_trips
    user_trips.to_json(
      include: {
        trip: {include: :segments}
      }
    )
  end

  # get a single trip for a user 
  get '/users/:user_id/trips/:trip_id' do
    current_user_id = params[:user_id]
    trip_id = params[:trip_id]
    user_trips = User.find(current_user_id).user_trips
    trip = user_trips.find_by_trip_id(trip_id)
    trip.to_json(
      include: {
        trip: {include: :segments}
      }
    )
  end

  # get events associated with a trip
  get '/trips/:id/events' do
    trip_id = params[:id]
    Trip.find(trip_id).events.all.to_json
  end

  # get all users for a trip
  get '/trips/:id/users' do
    trip_id = params[:id]
    Trip.find(trip_id).users.all.to_json
  end

  post '/events' do
    Event.create(
      trip_id: params[:trip_id],
      user_id: params[:user_id],
      name: params[:name],
      description: params[:description],
      start: params[:start],
      end: params[:end]
    ).to_json
  end

  delete '/events/:id' do
    event_id = params[:id]
    event = Event.find(event_id)
    event.destroy.to_json
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
    segment.destroy.to_json
  end
end