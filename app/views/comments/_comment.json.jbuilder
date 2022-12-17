json.extract! comment, :id, :user_id, :service_id, :rating, :body, :created_at, :updated_at
json.url comment_url(comment, format: :json)
