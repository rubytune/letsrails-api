class AddingExtraFieldsForPerson < ActiveRecord::Migration
  def up
    add_column :people, :gender, :string
    add_column :people, :born_on, :date
    add_column :people, :city_id, :integer

  end

  def down
  end
end
