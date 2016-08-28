class Outline 
  include Neo4j::ActiveNode
  property :text, type: String
  property :source_id, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime



end
