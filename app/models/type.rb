class Type < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  # Url
  acts_as_url :libelle, url_attribute: :slug
  def to_param
      slug
  end

end
