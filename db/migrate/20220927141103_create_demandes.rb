class CreateDemandes < ActiveRecord::Migration[7.0]
  def change
    create_table :demandes do |t|
      t.integer :type_document, null: false
      t.string :nom
      t.string :prénom
      t.date :date_naissance
      t.string :lieu_naissance
      t.string :disctrict
      t.string :workflow_state

      t.timestamps
    end
  end
end
