class CreateLocationPhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :location_photos do |t|
      t.text :fetched_url
      t.integer :height
      t.integer :width
      t.text :html_attributions
      t.text :photo_reference
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
