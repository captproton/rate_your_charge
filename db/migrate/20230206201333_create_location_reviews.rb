class CreateLocationReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :location_reviews do |t|
      t.string :author_name
      t.string :author_url
      t.string :profile_url
      t.integer :rating
      t.string :text
      t.integer :time
      t.string :type
      t.string :online_source
      t.belongs_to :location, null: false, foreign_key: true

      t.timestamps
    end
  end
end
