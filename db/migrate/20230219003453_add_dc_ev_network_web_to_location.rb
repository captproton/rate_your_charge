class AddDcEvNetworkWebToLocation < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :ev_network_web, :string
  end
end
