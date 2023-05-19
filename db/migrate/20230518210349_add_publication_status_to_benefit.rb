class AddPublicationStatusToBenefit < ActiveRecord::Migration[7.0]
  def change
    add_column :benefits, :publication_status, :boolean, null: false, default: false
  end
end
