json.extract! event, :id, :label, :description, :start_date, :end_date, :age, :period, :link, :created_at, :updated_at
json.url event_url(event, format: :json)