class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.belongs_to :country, :null => false
      t.string :name, :null => false
      t.string :slug, :null => false
      t.string :time_zone, :null => false

      t.timestamps
    end
    add_index :cities, :country_id
    add_index :cities, [:country_id, :slug], :unqiue => true
  end
end
