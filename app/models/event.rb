class Event 
  include Neo4j::ActiveNode
  property :label, type: String
  property :description, type: String
  property :start_date, type: DateTime
  property :end_date, type: DateTime
  property :age, type: String
  property :period, type: String
  property :link, type: String



end
