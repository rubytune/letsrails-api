class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name, :null => false
      t.string :code, :null => false
      t.string :language, :null => false

      t.timestamps
    end
  end
end
