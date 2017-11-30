class AddScreenNameToPerson < ActiveRecord::Migration
  def change
    add_column :people, :screen_label, :string
  end
end
