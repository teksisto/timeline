class QuoteVersion 
  include Neo4j::ActiveNode
  property :quote_id, type: String
  property :language, type: String
  property :text, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime



end
