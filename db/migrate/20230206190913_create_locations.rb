class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :street_number
      t.string :street
      t.string :postal_code
      t.string :city
      t.string :country
      t.string :formatted_address
      t.string :formatted_phone_number
      t.string :international_phone_number
      t.float :lat
      t.float :lng
      t.string :name
      t.string :permanently_closed
      t.string :photos
      t.string :place_id
      t.float  :rating
      t.string :types, array: true, default: []
      t.string :region
      t.string :google_url
      t.string :vicinity
      t.string :website

      t.timestamps
    end
  end
end
