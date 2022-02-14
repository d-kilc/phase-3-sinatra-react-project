class Trip < ActiveRecord::Base
    has_many :segments
    belongs_to :user
end