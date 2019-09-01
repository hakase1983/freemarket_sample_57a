class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string  :name,     null: false,unique: true
      t.string  :email,    null: false,unigue: true
      t.string  :password, null: false
      t.string  :image
      t.text    :profile
      t.timestamps
    end
  end
end
