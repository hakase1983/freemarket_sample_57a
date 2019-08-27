class Item < ApplicationRecord
  belongs_to :user
  belongs_to :brand
  belongs_to :size
  belongs_to :first_category
  belongs_to :second_category
  belongs_to :third_category
  has_many :comments
  has_many :likes
  has_one :seller
  has_one :buyer
  has_one :delivery
  has_one :dealing
  has_one :image

  accepts_nested_attributes_for :delivery
end
