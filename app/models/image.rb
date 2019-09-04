class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :image1, ImageUploader
end
