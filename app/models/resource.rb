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
    
    #query = RDF::Virtuoso::Query.select(:s, :p, :o).where( [:s, :p, :o] ).limit(1000)
    query = @@connection.construct([:s, :p, :o]).where([:s, :p, :o]).limit(1000)

    Rails.logger.debug(query.inspect.red)
    Rails.logger.debug(query.to_s.inspect.red)

    
    query.solutions
  end
  
end
