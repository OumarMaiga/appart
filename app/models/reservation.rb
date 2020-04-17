class Reservation < ApplicationRecord
  belongs_to :location
  belongs_to :user, optional: true

  validates :debut, :fin, presence: true, disponibilite: true
  validate :date_fin_after_date_debut
  
  
  #Enregistrement de la notification
  after_create do
    Notification.create!(reservation_id: Reservation.unscoped.last.id, vue: false, type_notification: "reservation")
  end

  default_scope { order(created_at: :desc) }

  # Pagination
  paginates_per(8)

  private

  def date_fin_after_date_debut
    return if fin.blank? || debut.blank?

    if fin < debut
      errors.add(:fin, "doit être superieur à la date de debut")
    end
  end

end
