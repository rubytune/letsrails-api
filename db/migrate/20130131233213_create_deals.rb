class CreateDeals < ActiveRecord::Migration
  def change
    create_table :deals do |t|
      t.belongs_to :city, :null => false
      t.string :short_title, :null => false
      t.string :long_title, :null => false
      t.text :description, :null => false
      t.datetime :offer_starts_at, :null => false
      t.datetime :offer_ends_at, :null => false

      t.timestamps
    end
    add_index :deals, :city_id
  end
end
