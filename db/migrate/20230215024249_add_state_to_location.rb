class AddStateToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :state, :string
  end
end
