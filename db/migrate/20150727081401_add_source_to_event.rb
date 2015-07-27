class AddSourceToEvent < ActiveRecord::Migration
  def change

    add_column :events, :source_id, :integer
    
  end
end
