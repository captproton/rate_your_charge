class AddKeywordToBenefit < ActiveRecord::Migration[7.0]
  def change
    add_column :benefits, :keyword, :string
  end
end
