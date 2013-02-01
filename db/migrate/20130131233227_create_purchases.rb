class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.belongs_to :option, :null => false
      t.belongs_to :person, :null => false
      t.belongs_to :credit_card, :null => false
      t.string :aasm_state, :null => false
      t.integer :quantity, :null => false

      t.timestamps
    end
    add_index :purchases, :option_id
    add_index :purchases, :person_id
    add_index :purchases, :credit_card_id
  end
end
