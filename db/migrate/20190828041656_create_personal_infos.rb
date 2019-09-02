class CreatePersonalInfos < ActiveRecord::Migration[5.2]
  def change
    create_table :personal_infos do |t|
      t.string :family_name,         null: false
      t.string :first_name,          null: false
      t.string :family_name_kana,    null: false
      t.string :first_name_kana,     null: false
      t.integer :postal_code,        null: false
      t.string :prefecture_code,     null: false
      t.string :city_code,           null: false
      t.string :address_num,         null: false
      t.string :building_name
      t.string :telephone
      t.date :birth_day           
      t.references :user,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
