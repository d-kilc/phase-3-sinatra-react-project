class CreateTrips < ActiveRecord::Migration[6.1]
  def change
    create_table :trips do |t|
      t.references :user, foreign_key: true
      t.string :description
    end
  end
end
