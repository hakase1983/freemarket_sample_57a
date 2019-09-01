class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name ,null: false
      t.references :image ,null: false ,foreign_key: true
      t.text :description ,null: false
      t.references :category ,null: false ,foreign_key: true
      t.references :size ,null: false ,foreign_key: true
      t.references :brand,foreign_key: true
      t.string :condition ,null: false
      t.integer :price ,null: false
      t.timestamps
    end
  end
end
