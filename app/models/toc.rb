class Toc < ActiveRecord::Base

  acts_as_nested_set

  has_one :outline
  has_one :source

end
