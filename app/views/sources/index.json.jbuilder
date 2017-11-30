json.array!(@sources) do |source|
  json.extract! source, :id, :name, :description, :link
  json.url source_url(source, format: :json)
end
