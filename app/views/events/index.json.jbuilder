json.array!(@events) do |event|
  json.extract! event, :id, :name, :year, :month, :day, :description
  json.url event_url(event, format: :json)
end
