class CreateCreditCards < ActiveRecord::Migration
  def change
    create_table :credit_cards do |t|
      t.belongs_to :person, :null => false
      t.string :encrypted_number, :null => false
      t.string :encrypted_number_salt, :null => false
      t.string :encrypted_number_iv, :null => false
      t.string :cardholder_name, :null => false
      t.integer :expiration_month, :null => false
      t.integer :expiration_year, :null => false
      t.string :first_six, :null => false
      t.string :last_four, :null => false
      t.integer :number_length, :null => false
      t.boolean :primary

      t.timestamps
    end
    add_index :credit_cards, :person_id
  end
end
