class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # return all trips
  get '/trips' do
    Trip.all.to_json
  end

  #placeholder- get dummy user and trips and segments
  get '/users' do
    User.first.to_json(
      include: {
        trips: {include: :segments}
      }
    )
  end
  
  #returns all user's trips and segments
  get "/trips/:id" do
    current_user_id = params[:id]
    user_trips = User.find(current_user_id).usertrips
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

  # posts a trip and segments to a user
  post '/trips' do
    new_trip = Trip.create(description: params[:tripName])
    new_usertrip = Usertrip.create(user_id: params[:user_id], trip_id: new_trip.id, role: 'creator')

    params[:segments].each do |segment|
      Segment.create(from: segment[:from], to: segment[:to], date: segment[:date], trip_id: new_trip.id)
    end

    #return all user's trips after post
    new_trip.to_json(include: :segments)
  end

  # get all the users for a trip so we can show everyone that's going
  get '/trips/:id/users' do
    trip_id = params[:id]
    Trip.find(trip_id).users.to_json
  end

end
