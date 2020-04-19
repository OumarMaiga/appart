class DisponibiliteValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        reservations = Reservation.where(location_id: record.location_id)
        date_ranges = reservations.map { |b| b.debut..b.fin }
        
        date_ranges.each do |range|
            range.inspect
            if range.include? value
                record.errors.add(attribute, "Indisponible")
            end
        end
    end
end