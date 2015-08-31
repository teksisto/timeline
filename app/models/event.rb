# coding: utf-8
class Event < ActiveRecord::Base

  RENDER_METHODS = [
    'timeline_table',
    'timeline_with_categories',
    'vis_timeline',
    'editor'
  ]
  
  belongs_to :source
  belongs_to :location, class_name: Category, foreign_key: 'location_id'
  has_and_belongs_to_many :categories
  

  before_save :setup_dates
  
  scope :from_sources, lambda{|source_ids|
    joins(:source).where(sources: {id: source_ids})
  }
  
  scope :from_categories, lambda{|category_ids|
    where(id:
            (
              ids_from_categories(category_ids) +
              ids_from_categories_via_sources(category_ids) +
              ids_from_categories_by_locations(category_ids)
            )
         )
  }

  scope :from_location, lambda{|category|
    if category.kind_of?(Integer)
      category_id = category_id
    else
      category_id = category.id
    end
    where(location_id: category_id)
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
    
  def self.ids_from_categories_by_locations(category_ids)
    Event.where(location_id: category_ids).pluck(:id)
  end
  
  def self.by_year(events)
    unless events.empty?
      
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
    else
      {}
    end
  end

  private

  # Этот метод должен дружить не только с данными, которые
  # приходят из контроллера, но из с данными из fixtures.
  
  def setup_dates
    year, month, day = parse_start_date

    if period?

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
      if self[:end_date].present?
        expand_end_date
      end
      
    else
      
      if year && month && day
        self[:start_date] = Date.new( year, month, day )
      elsif year && month && !day
        self[:start_date] = Date.new( year, month, 15  )
      elsif year && !month && !day
        self[:start_date] = Date.new( year, 6,     15  )
      end

    end
  end

  def parse_start_date
    parse_date(start_date_before_type_cast)
  end

  def parse_end_date
    parse_date(end_date_before_type_cast)
  end

  def expand_end_date
    year, month, day = parse_end_date
    month = 12 unless month && day
    day = 31 unless day
    self[:end_date] = Date.new(year, month, day)
  end
  
  def parse_date(value)
    # to_s в следующей строке нужен, потому что fixtures внезапно возвращает integer
    str = value.to_s
    matches = str.match(/(\d{4})-?(\d{2})?-?(\d{2})?/).to_a
    # нам нужны только группы, а первый матч - это вся строка, поэтому он выкидывается
    matches.shift
    # если данные есть, то вернуть integer, если нет - nil
    matches.map{|s| s.to_i if s.present?}
  end
  
end
