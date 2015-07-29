json.array!(@tocs) do |toc|
  json.extract! toc, :id, :name, :parent_id, :lft, :rgt, :depth, :children_count, :outline_id
  json.url toc_url(toc, format: :json)
end
