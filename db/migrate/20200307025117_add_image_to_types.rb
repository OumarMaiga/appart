class AddImageToTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :types, :image, :string
  end
end
