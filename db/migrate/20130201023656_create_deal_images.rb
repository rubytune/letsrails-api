class CreateDealImages < ActiveRecord::Migration
  def change
    create_table :deal_images do |t|
      t.belongs_to :deal, :null => false
      t.string :url, :null => false
      t.integer :width, :null => false
      t.integer :height, :null => false

      t.timestamps
    end
    add_index :deal_images, :deal_id
  end
end
