class Notification < ApplicationRecord
  belongs_to :reservation

  default_scope { order(created_at: :desc) }
  scope :non_vue, -> { where(vue: false) }

end
