class Delivery < ApplicationRecord
  belongs_to :item

  validates :fee, presence: true
  validates :area, presence: true
  validates :delivery_days, presence: true
end
