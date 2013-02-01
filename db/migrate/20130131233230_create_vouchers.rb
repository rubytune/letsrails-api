class CreateVouchers < ActiveRecord::Migration
  def change
    create_table :vouchers do |t|
      t.belongs_to :purchase, :null => false
      t.string :customer_code, :null => false
      t.datetime :redeemed_at

      t.timestamps
    end
    add_index :vouchers, :purchase_id
  end
end
