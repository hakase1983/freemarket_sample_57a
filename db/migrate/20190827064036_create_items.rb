class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name ,null: false
      t.text :description ,null: false
      t.references :category ,null: false ,foreign_key: true
      t.references :brand ,foreign_key: true
      t.string :condition ,null: false
      t.integer :price ,null: false
      t.references :user ,null:false ,foreign_key: true
      t.integer :seller_id ,null: false ,foreign_key: true
      t.integer :buyer_id, foreign_key: true
      t.timestamps
    end
  end
end
