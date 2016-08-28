class QuoteVersion 
  include Neo4j::ActiveNode

  property :language,   type: String
  property :content,    type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  has_many :out, :quotes, type: :has_version

end
