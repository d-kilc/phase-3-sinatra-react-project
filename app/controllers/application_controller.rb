class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get '/trips' do
    Trip.all.to_json
  end

  #placeholder
  get '/users' do
    User.first.to_json(
      include: {
        trips: {include: :segments}
      }
    )
  end
  
  #returns trip with segments
  get "/trips/:id" do
    user_trips = Trip.all.filter{|trip| trip.user_id == params[:id].to_i }
    user_trips.to_json include: :segments
  end

  post '/trips' do
    new_trip = Trip.create(user_id: params[:user_id], description: params[:tripName])
    
    params[:segments].each do |segment|
      Segment.create(from: segment[:from], to: segment[:to], date: segment[:date], trip_id: new_trip.id)
    end
  end

end
