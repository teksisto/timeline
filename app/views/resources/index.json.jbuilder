json.array!(@resources) do |resource|
  json.extract! resource, :id
  json.url resource_url(resource, format: :json)
end
