class Source < ActiveRecord::Base

  has_many :events
  belongs_to :category
  
end
