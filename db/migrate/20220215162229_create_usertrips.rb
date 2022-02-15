class CreateUsertrips < ActiveRecord::Migration[6.1]
  def change
    create_table :usertrips do |t|
      t.references :user, foreign_key: true
      t.references :trip, foreign_key: true
      t.string :role
    end
  end
end
