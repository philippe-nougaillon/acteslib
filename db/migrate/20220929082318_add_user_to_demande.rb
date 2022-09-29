class AddUserToDemande < ActiveRecord::Migration[7.0]
  def change
    add_reference :demandes, :user, null: false, foreign_key: true
  end
end
