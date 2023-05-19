class CreateBenefits < ActiveRecord::Migration[7.0]
  def change
    create_table :benefits do |t|
      t.string :title
      t.string :subtitle

      t.timestamps
    end
  end
end
