class AddTypeToDeal < ActiveRecord::Migration
  def change
    add_column :deals, :type, :string, default: 'LocalDeal'
  end
end
