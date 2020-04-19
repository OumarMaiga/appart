json.extract! location, :id, :titre, :adresse, :description, :etat, :prix, :type, :nombre_adulte, :nombre_enfant, :nombre_salon, :nombre_chamber, :nombre_toillete, :user_id, :created_at, :updated_at
json.url location_url(location, format: :json)
