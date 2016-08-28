class Source 
  include Neo4j::ActiveNode
  property :label, type: String
  property :category_id, type: String
  property :parent, type: String
  property :link, type: String
  property :text, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime



end
