class CreateCityStates < ActiveRecord::Migration[7.0]
  def change
    create_table :city_states do |t|
      t.string :city
      t.string :state

      t.timestamps
    end
  end
end
