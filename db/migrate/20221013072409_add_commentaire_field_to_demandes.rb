class AddCommentaireFieldToDemandes < ActiveRecord::Migration[7.0]
  def change
    add_column :demandes, :observation, :text
  end
end
