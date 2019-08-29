class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name ,null: false
      t.references :image ,null: false ,foreign_key: true
      t.text :description ,null: false
      t.references :first_category ,null: false ,foreign_key: true
      t.references :second_category ,null: false ,foreign_key: true
      t.references :third_category ,foreign_key: true
      t.references :size ,null: false ,foreign_key: true
      t.references :brand,foreign_key: true
      t.string :condition ,null: false
      t.integer :price ,null: false
      t.references :seller ,null: false ,foreign_key: true
      t.references :buyer ,null: false ,foreign_key: true
      t.timestamps
    end
  end
end
