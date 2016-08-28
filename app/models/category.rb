class Category 
  include Neo4j::ActiveNode
  property :label, type: String
  property :description, type: String
  property :icon, type: String
  property :color, type: String
  property :created_at, type: DateTime
  property :updated_at, type: DateTime

  has_many :in, :events, type: :has_category


end
