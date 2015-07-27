class DropEventsWithDate < ActiveRecord::Migration
  def change

    drop_table :events
    
  end
end
