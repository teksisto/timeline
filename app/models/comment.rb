class Comment < ApplicationRecord

  belongs_to :quote
  belongs_to :author, class_name: 'Person'

end
