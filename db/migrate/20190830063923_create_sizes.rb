class CreateSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :sizes do |t|
      t.string :name,null: false
      t.references :item ,null: false ,foreign_key: true
      t.timestamps
    end
  end
end
