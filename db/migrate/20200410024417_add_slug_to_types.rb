class AddSlugToTypes < ActiveRecord::Migration[6.0]
  def change
    add_column :types, :slug, :string
  end
end
