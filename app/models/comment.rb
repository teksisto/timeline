class Comment 
  include Neo4j::ActiveNode
  property :author_id, type: String
  property :quote_id, type: String
  property :text, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime



end
