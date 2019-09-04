class PersonalInfo < ApplicationRecord
  belongs_to :user, optional: true
end
