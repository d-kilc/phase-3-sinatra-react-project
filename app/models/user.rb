class User < ActiveRecord::Base
    has_many :usertrips
    has_many :trips, through: :usertrips
end