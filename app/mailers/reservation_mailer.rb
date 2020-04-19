class ReservationMailer < ApplicationMailer
    
    def reservation_confirmer(reservation)
        @reservation = reservation
        mail(to: @reservation.email, subject:'Confirmation de la reservatrion')
    end

end
