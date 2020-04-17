class Location < ApplicationRecord
  belongs_to :user
  has_many :images
  belongs_to :type
  has_many :reservations
  #accepts_nested_attributes_for :images, allow_destroy: true

  has_and_belongs_to_many :caracteristiques

  def dates_indisponible
    reservations.pluck(:debut, :fin).map do |range|
      { from: range[0], to: range[1] }
    end
  end

  # Pagination
  paginates_per(8)

  # Url
  acts_as_url :titre, url_attribute: :slug
  def to_param
      slug
  end

end
