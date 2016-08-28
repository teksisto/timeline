class Location 
  include Neo4j::ActiveNode
  property :label, type: String
  property :description, type: String
  property :icon, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime



end
