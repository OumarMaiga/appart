class CreateReservations < ActiveRecord::Migration[6.0]
  def change
    create_table :reservations do |t|
      t.references :location, null: false, foreign_key: true
      t.references :user, null: true, foreign_key: true
      t.string :slug
      t.string :email
      t.string :nom
      t.string :prenom
      t.date :debut
      t.date :fin
      t.integer :nombre_adulte
      t.integer :nombre_enfant
      t.integer :montant_paye, limit: 8
      t.integer :telephone, limit: 8
      t.boolean :confirmer, default: false
      
      t.timestamps
    end
  end
end
