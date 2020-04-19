json.extract! reservation, :id, :location_id, :user_id, :nom, :prenom, :debut, :fin, :nombre_personne, :montant_paye, :created_at, :updated_at
json.url reservation_url(reservation, format: :json)
