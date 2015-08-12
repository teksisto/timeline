class Quote < ActiveRecord::Base

  belongs_to :toc
  has_many :comments
  
end
