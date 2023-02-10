class ChangeLngToDecimalInLocation < ActiveRecord::Migration[7.0]
  def change
    change_column :locations, :lng, :decimal, precision: 10, scale: 6    
  end
end
