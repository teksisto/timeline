class Event < ActiveRecord::Base
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
