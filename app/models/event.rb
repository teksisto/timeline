class Event 
  include Neo4j::ActiveNode

  property :label, type: String
  property :description, type: String
  property :start_date, type: DateTime
  property :end_date, type: DateTime
  property :age, type: String
  property :period, type: String
  property :link, type: String

  has_many :in,  :quotes,     type: :supports
  
  has_one  :out, :location,   type: :happend_in
  has_many :out, :categories, type: :has_category
  has_many :out, :people,     type: :involves
  
end
