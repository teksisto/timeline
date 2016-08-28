class Quote 
  include Neo4j::ActiveNode
  property :label, type: String
  property :source_id, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  has_many :out, :versions, type: :has_version, model_class: :QuoteVersion
  has_many :out, :events,   type: :supports

end
