class CaracteristiquesLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :caracteristiques_locations, id: false do |t|
      t.belongs_to :caracteristique
      t.belongs_to :location
    end
  end
end
