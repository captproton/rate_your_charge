class AddValuePropToBenefit < ActiveRecord::Migration[7.0]
  def change
    add_column :benefits, :value_prop, :string
  end
end
