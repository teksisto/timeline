class Event < ActiveRecord::Base

  RENDER_METHODS = [
    'timeline_table',
    'timeline_with_categories',
    'editor'
  ]
  
  belongs_to :source

  has_and_belongs_to_many :categories

  scope :from_sources, lambda{|source_ids|
    joins(:source).where(sources: {id: source_ids})
  }
  
  scope :from_categories, lambda{|category_ids|
    joins(:categories).where(categories: {id: category_ids})
  }
  
  def self.by_year(events)
        
    events_by_year = events.group_by(&:year)

    start_year = events.minimum(:year)
    end_year = events.maximum(:year)

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
