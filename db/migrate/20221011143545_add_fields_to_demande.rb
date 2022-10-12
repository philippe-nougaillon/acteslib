class AddFieldsToDemande < ActiveRecord::Migration[7.0]
  def change
    add_column :demandes, :number, :integer
    add_column :demandes, :sous_prefecture, :string
    add_column :demandes, :commune, :string
  end
end
