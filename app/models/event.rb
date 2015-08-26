# coding: utf-8
class Event < ActiveRecord::Base

  RENDER_METHODS = [
    'timeline_table',
    'timeline_with_categories',
    'vis_timeline',
    'editor'
  ]
  
  belongs_to :source

  has_and_belongs_to_many :categories

  before_save :setup_dates
  
  scope :from_sources, lambda{|source_ids|
    joins(:source).where(sources: {id: source_ids})
  }
  
  scope :from_categories, lambda{|category_ids|
    where(id: (ids_from_categories(category_ids)+ids_from_categories_via_sources(category_ids)))
  }

  scope :sorted, lambda{
    order('start_date')
  }
  
  def self.ids_from_categories(category_ids)
    Event.joins(:categories).where(categories: {id: category_ids})
  end
    
  def self.ids_from_categories_via_sources(category_ids)
    Event.joins(:source).where(sources: {category_id: category_ids}).pluck(:id)
  end
    
  def self.by_year(events)
        
    events_by_year = events.group_by{|e| e.start_date.year}

    start_year = events.minimum(:start_date).year
    end_year = events.maximum(:end_date).year

    if start_year && end_year
      for y in start_year..end_year
        unless events_by_year[y]
          events_by_year[y] = []
        end
      end
      events_by_year
    else
      {}
    end
  end

  private

  # Этот метод должен дружить не только с данными, которые
  # приходят из контроллера, но из с данными из fixtures.
  
  def setup_dates
    year, month, day = parse_start_date
    if year && month && day
      self[:start_date] = Date.new(year, month, day)
      unless self[:end_date].present?
        self[:end_date] = self[:start_date]
      end
    elsif year && month && !day
      self[:start_date] = Date.new(year, month, 1)
      unless self[:end_date].present?
        self[:end_date] = self[:start_date] + 1.month - 1.day
      end
    elsif year && !month && !day
      self[:start_date] = Date.new(year, 1, 1)
      unless self[:end_date].present?
        self[:end_date] = self[:start_date] + 1.year - 1.day
      end
    end
    
  end

  def parse_start_date
    # to_s в следующей строке нужен, потому что fixtures внезапно возвращает integer
    str = start_date_before_type_cast.to_s
    matches = str.match(/(\d{4})-?(\d{2})?-?(\d{2})?/).to_a
    # нам нужны только группы, а первый матч - это вся строка, поэтому он выкидывается
    matches.shift
    # если данные есть, то вернуть integer, если нет - nil
    matches.map{|s| s.to_i if s.present?}
  end
  
end
