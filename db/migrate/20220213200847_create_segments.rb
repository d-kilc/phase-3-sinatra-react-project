class CreateSegments < ActiveRecord::Migration[6.1]
  def change
    create_table :segments do |t|
      t.string :from
      t.string :to
      t.datetime :date
      t.references :trip, foreign_key: true
    end
  end
end
