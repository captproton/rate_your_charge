class AddOwnerTypeCodeToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :owner_type_code, :string
  end
end
