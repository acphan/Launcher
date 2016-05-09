json.array!(@projects) do |project|
  json.extract! project, :id, :title, :url, :description
  json.url project_url(project, format: :json)
end
