class AddDcEvNetworkToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :ev_network, :string
  end
end
