json.array!(@quotes) do |quote|
  json.extract! quote, :id, :title, :content, :source_id
  json.url quote_url(quote, format: :json)
end
