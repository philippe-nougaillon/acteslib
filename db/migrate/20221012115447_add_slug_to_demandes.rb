class AddSlugToDemandes < ActiveRecord::Migration[7.0]
  def change
    add_column :demandes, :slug, :string
    add_index :demandes, :slug, unique: true
  end
end
