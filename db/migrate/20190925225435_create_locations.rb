class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :titre
      t.text :adresse
      t.text :description
      t.boolean :etat
      t.integer :prix, limit: 8
      t.string :duree
      t.references :type, foreign_key: true
      t.integer :nombre_adulte, limit: 8
      t.integer :nombre_enfant, limit: 8
      t.integer :nombre_salon, limit: 8
      t.integer :nombre_chamber, limit: 8
      t.integer :nombre_toillete, limit: 8
      t.references :user, null: false, foreign_key: true

      t.string :nom_bailleur
      t.string :email_bailleur  
      t.integer :telephone_bailleur, limit: 8
      t.text :adresse_bailleur, 
      

      t.timestamps
    end
  end
end
