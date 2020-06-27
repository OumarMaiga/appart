class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :locations
  has_many :types
  has_many :reservations

  # Upload d'image
  mount_uploader :image, ImageUploader
  

end
