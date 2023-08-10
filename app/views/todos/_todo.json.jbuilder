json.extract! todo, :id, :title, :status, :date, :created_at, :updated_at
json.url todo_url(todo, format: :json)
