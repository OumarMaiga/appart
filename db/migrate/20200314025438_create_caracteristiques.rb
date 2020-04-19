class CreateCaracteristiques < ActiveRecord::Migration[6.0]
  def change
    create_table :caracteristiques do |t|
      t.string :libelle
      t.string :icon

      t.timestamps
    end
  end
end
