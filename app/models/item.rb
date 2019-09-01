class Item < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :size
  belongs_to :category
  has_many :comments
  has_many :likes
  has_one :seller
  has_one :buyer
  has_one :delivery
  has_one :dealing
  has_one :image
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  accepts_nested_attributes_for :delivery
end
