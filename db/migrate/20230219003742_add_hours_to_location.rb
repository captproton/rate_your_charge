class AddHoursToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :hours, :string
  end
end
