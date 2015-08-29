class Quote < ActiveRecord::Base

  belongs_to :source
  has_many :comments
  
end
