class AddTelephoneToReservation < ActiveRecord::Migration[6.0]
  def change
    add_column :reservations, :telephone, :integer, limit: 8
  end
end
