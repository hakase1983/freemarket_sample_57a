class FirstCategory < ApplicationRecord
  has_many :items
  has_many :second_categories
end
