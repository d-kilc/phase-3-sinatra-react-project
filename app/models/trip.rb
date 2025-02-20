class Trip < ActiveRecord::Base
    has_many :segments
    has_many :user_trips
    has_many :users, through: :user_trips
    has_many :events
end