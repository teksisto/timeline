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

  
  def self.all
    query = @@connection.construct([:s, :p, :o]).where([:s, :p, :o]).limit(1000)

    Rails.logger.debug(query.to_s.inspect.red)
    
    query.solutions.to_a
  end

  def self.find(resource)
    query = @@connection.describe(resource)
    Rails.logger.debug(query.to_s.inspect.red)
    Rails.logger.debug(query.solutions)

    
    r = query.solutions.to_a

    r
  end
  
end
