class CreateTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :types do |t|
      t.string :libelle
      t.boolean :etat
      t.string :image
      t.string :slug
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
