class AddLevelTwoChargerCountToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :level_two_charger_count, :integer
  end
end
