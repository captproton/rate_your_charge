class AddBodyToBenefit < ActiveRecord::Migration[7.0]
  def change
    add_column :benefits, :body, :text
  end
end
