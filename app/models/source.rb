class Source < ActiveRecord::Base

  has_many :events
  belongs_to :category

  belongs_to :toc
  
end
