class DisponibiliteValidator < ActiveModel::EachValidator

    def validate_each(record, attribute, value)
        reservations = Reservation.where(location_id: record.location_id)
        date_ranges = reservations.map { |b| b.debut..b.fin }
        puts "-------------------------"
        puts date_ranges.inspect
        puts "-------------------------"
        
        date_ranges.each do |range|
            puts"==================="
            puts range.inspect
            puts"==================="
            if range.include? value
                puts"Include"
                record.errors.add(attribute, "Indisponible")
            end
        end
    end
end