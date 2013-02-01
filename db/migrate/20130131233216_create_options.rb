class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.belongs_to :deal, :null => false
      t.string :title, :null => false
      t.decimal :price, :null => false
      t.decimal :value, :null => false
      t.boolean :primary

      t.timestamps
    end
    add_index :options, :deal_id
  end
end
