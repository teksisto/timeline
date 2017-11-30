json.array!(@categories) do |category|
  json.extract! category, :id, :name, :description, :color
  json.url category_url(category, format: :json)
end
