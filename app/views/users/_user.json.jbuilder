json.extract! user, :id, :name, :email, :moderator,
              :creator, :disactive, :comments_count,
              :posts_count, :created_at, :updated_at
json.url user_url(user, format: :json)
