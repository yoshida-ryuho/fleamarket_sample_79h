class Image < ApplicationRecord
  belongs_to :item, inverse_of: :images
  mount_uploader :url, ImageUploader
end
