json.extract! photo, :id, :title, :description, :category, :likes, :image, :timestamps,
              :created_at, :updated_at
json.url photo_url(photo, format: :json)
