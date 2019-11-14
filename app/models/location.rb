class Location < ApplicationRecord
  belongs_to :user
  has_many :images
  belongs_to :type
  has_many :reservations
  #accepts_nested_attributes_for :images, allow_destroy: true

  def dates_indisponible
    reservations.pluck(:debut, :fin).map do |range|
      puts"=============="
      puts range.inspect
      { from: range[0], to: range[1] }
    end
  end

end
