class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.references :user,null: false, foreign_key: true
      t.string :item_id
      t.timestamps
    end
  end
end
