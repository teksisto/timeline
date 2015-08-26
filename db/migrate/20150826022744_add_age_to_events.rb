class AddAgeToEvents < ActiveRecord::Migration
  def change
    add_column :events, :age, :boolean, :default => false
  end
end
