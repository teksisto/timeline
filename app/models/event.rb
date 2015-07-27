class Event < ActiveRecord::Base

  validates_presence_of :name, :date, :description
  
  validates :date, date: true
  
end
