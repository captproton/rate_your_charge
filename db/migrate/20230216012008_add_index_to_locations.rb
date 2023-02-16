class AddIndexToLocations < ActiveRecord::Migration[7.0]
  def change
    add_index :locations, :city
    add_index :locations, :state
  end
end
