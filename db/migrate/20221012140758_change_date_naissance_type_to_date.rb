class ChangeDateNaissanceTypeToDate < ActiveRecord::Migration[7.0]
  def change
    change_column :demandes, :date_naissance, 'date USING CAST(date_naissance AS date)'
  end
end
