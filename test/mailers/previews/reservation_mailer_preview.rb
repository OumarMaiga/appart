# Preview all emails at http://localhost:3000/rails/mailers/reservation_mailer
class ReservationMailerPreview < ActionMailer::Preview

    def reservation_confirmer
        reservation = Reservation.find(@reservation.id)
        ReservationMailer.reservation_confirmer(reservation)
    end
end