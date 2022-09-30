class ChangeDemandeDateToString < ActiveRecord::Migration[7.0]
  def change
    change_column :demandes, :date_naissance, :string
  end
end
