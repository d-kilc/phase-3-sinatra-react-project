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
    user_trips = Trip.all.filter{|trip| trip.user_id == params[:id].to_i }
    user_trips.to_json include: :segments
  end

  # posts a trip and segments to a user
  post '/trips' do
    new_trip = Trip.create(user_id: params[:user_id], description: params[:tripName])
    
    params[:segments].each do |segment|
      Segment.create(from: segment[:from], to: segment[:to], date: segment[:date], trip_id: new_trip.id)
    end

    #return all user's trips after post
    new_trip.to_json(include: :segments)
  end

end
