class Quote 
  include Neo4j::ActiveNode
  property :label, type: String
  property :source_id, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime



end
