class AddCommentToVisit < ActiveRecord::Migration[7.0]
  def change
    add_column :visits, :comment, :text
  end
end
