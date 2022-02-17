class CreateEvents < ActiveRecord::Migration[6.1]
  def change
      create_table :events do |t|
        t.string :name
        t.string :description
        t.datetime :start
        t.datetime :end
        t.references :user, foreign_key: true
        t.references :trip, foreign_key: true
      end
  end
end
