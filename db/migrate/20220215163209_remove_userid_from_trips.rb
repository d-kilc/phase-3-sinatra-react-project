class RemoveUseridFromTrips < ActiveRecord::Migration[6.1]
  def change
    remove_column :trips, :user_id 
  end
end
