class AddLevelOneChargerCountToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :level_one_charger_count, :integer
  end
end
