class AddAgeToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :age, :boolean, :default => false
  end
end
