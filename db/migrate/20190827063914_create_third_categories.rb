class CreateThirdCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :third_categories do |t|
      t.string :name,null: false
      t.timestamps
    end
  end
end
