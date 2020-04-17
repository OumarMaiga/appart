class AddSlugToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :slug, :string
  end
end
