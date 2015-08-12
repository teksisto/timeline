class AddScreenNameToPerson < ActiveRecord::Migration
  def change
    add_column :people, :screen_name, :string
  end
end
