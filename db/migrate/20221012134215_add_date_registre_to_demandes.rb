class AddDateRegistreToDemandes < ActiveRecord::Migration[7.0]
  def change
    add_column :demandes, :date_registre, :date
    rename_column :demandes, :number, :numéro_registre
    rename_column :demandes, :sous_prefecture, :sous_préfecture
  end
end
