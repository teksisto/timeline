require 'sparql/client'

class Resource

  @@connection = SPARQL::Client.new("http://localhost:8890/sparql")

  #  @@connection = RDF::Virtuoso::Repository.new(
  #                  "http://localhost:8890/sparql", 
  #   :update_uri => "http://localhost:8890/sparql-auth",
  #   :username => 'dba', 
  #   :password => '***REMOVED***', 
  #   :auth_method => 'digest'
  # )

  attr_accessor :properties
  attr_accessor :uri
  
  def initialize(args) 
    @properties = args[:properties] || []
    @uri = args[:uri]
  end
  
  def self.all
    query = @@connection.construct([:s, :p, :o]).where([:s, :p, :o]).limit(1000)

    Rails.logger.debug(query.to_s.inspect.red)
    
    query.solutions.to_a
  end

  def self.find(resource)
    query = @@connection.describe(resource)
    Rails.logger.debug(query.to_s.inspect.red)
    Rails.logger.debug(query.solutions)

    properties = query.solutions.to_a

    Resource.new(uri: resource, properties: properties)
  end
  
end
