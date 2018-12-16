class AddScreenNameToPerson < ActiveRecord::Migration[5.1]
  def change
    add_column :people, :screen_label, :string
  end
end
