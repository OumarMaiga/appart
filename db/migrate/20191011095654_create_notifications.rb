class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.references :reservation, null: false, foreign_key: true
      t.boolean :vue, default: false
      t.string :type_notification

      t.timestamps
    end
  end
end
