class AddDatePeriodToEvent < ActiveRecord::Migration
  def change
    
    remove_column :events, :year
    remove_column :events, :month
    remove_column :events, :day

    add_column :events, :start_date, :date
    add_column :events, :end_date,   :date

  end
end
