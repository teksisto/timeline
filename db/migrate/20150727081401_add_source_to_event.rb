class AddSourceToEvent < ActiveRecord::Migration[5.1]
  def change

    add_column :events, :source_id, :integer
    
  end
end
