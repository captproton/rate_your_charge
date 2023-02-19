class AddDcFastChargerCountToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :dc_fast_charger_count, :integer
  end
end
