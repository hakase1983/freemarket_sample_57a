class Image < ApplicationRecord
  belongs_to :item
  mount_uploader :image1, ImageUploader
  mount_uploader :image2, ImageUploader

end
