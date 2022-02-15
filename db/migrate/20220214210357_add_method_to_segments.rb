class AddMethodToSegments < ActiveRecord::Migration[6.1]
  def change
    add_column :segments, :method, :string
  end
end
