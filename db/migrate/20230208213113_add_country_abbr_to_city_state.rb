class AddCountryAbbrToCityState < ActiveRecord::Migration[7.0]
  def change
    add_column :city_states, :country, :string
  end
end
