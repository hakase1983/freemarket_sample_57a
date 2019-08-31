class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_many :comments
  has_many :likes
  has_many :sellers
  has_many :buyers
  has_many :bought_items, foreign_key: "buyer_id"
  has_many :selling_items, -> {where("buyer_id is NULL") }, foreign_key: "seller_id"
  has_many :sold_items, -> { where("buyer_id is not NULL") }, foreign_key: "seller_id"
  has_one :personal_info

end