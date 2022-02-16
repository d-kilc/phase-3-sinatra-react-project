class CreateUserTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :user_trips do |t|
      t.references :user, foreign_key: true
      t.references :trip, foreign_key: true
      t.string :role
    end
  end
end
