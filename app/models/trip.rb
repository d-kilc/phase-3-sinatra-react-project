class Trip < ActiveRecord::Base
    has_many :segments
    has_many :usertrips
    has_many :users, through: :usertrips
end