class AddOnlineSourceToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :online_source, :string
  end
end
