class ThirdCategory < ApplicationRecord
  belongs_to :second_category
  has_many :items
end
