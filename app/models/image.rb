class Image < ApplicationRecord
  belongs_to :location
  mount_uploader :libelle, ImageUploader
end
