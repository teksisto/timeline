json.array!(@events) do |event|
  json.extract! event, :id, :label, :start_date, :end_date, :age, :period, :description
  json.url event_url(event, format: :json)
end
