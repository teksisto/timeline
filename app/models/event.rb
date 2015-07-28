class Event < ActiveRecord::Base

  RENDER_METHODS = [
    'timeline_table',
    'default_table'
  ]
  
  belongs_to :source

  has_and_belongs_to_many :categories
  
  def self.all_by_year
        
    events_by_year = Event.all.group_by(&:year)

    start_year = Event.minimum(:year)
    end_year = Event.maximum(:year)

    for y in start_year..end_year
      unless events_by_year[y]
        events_by_year[y] = []
      end
    end

    events_by_year
    
  end
    
  def date
    date_array = []
    date_array << year
    date_array << month if month.present?
    date_array << day if day.present?
    Date.new(*date_array)
  end

  def date=(d)
    year = d.year
    month = d.month
    day = d.day
  end
end
