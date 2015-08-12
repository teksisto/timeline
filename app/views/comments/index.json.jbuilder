json.array!(@comments) do |comment|
  json.extract! comment, :id, :author_id, :quote_id, :content
  json.url comment_url(comment, format: :json)
end
