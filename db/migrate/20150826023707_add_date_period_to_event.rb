class AddDatePeriodToEvent < ActiveRecord::Migration
  def self.up
    
    remove_column :events, :year
    remove_column :events, :month
    remove_column :events, :day

    add_column :events, :start_date, :date
    add_column :events, :end_date,   :date

  end

  def self.down
    
    remove_column :events, :start_date
    remove_column :events, :end_date
    
    add_column :events, :year,  :integer
    add_column :events, :month, :integer, null: true
    add_column :events, :day,   :integer, null: true

  end
  
end
