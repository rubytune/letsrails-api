class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :email, :null => false
      t.string :first_name
      t.string :last_name
      t.string :password_digest

      t.timestamps
    end

    add_index :people, :email, :unique => true
  end
end
