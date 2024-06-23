module Api::V1::ApiHelper::PhotoHelper
  def self.example_index_response
    {
      "photos": [
        {
          "id":          1,
          "title":       "MacBook",
          "description": "Macbook from Apple",
          "category":    "Technology",
          "likes":       83,
          "taken_at":    "2023-11-17T12:43:40.344Z",
          "tags":        "macbook, apple, laptop"
        }
      ],
      "meta":   {
        "current_page": 1,
        "next_page":    nil,
        "prev_page":    nil,
        "total_pages":  1,
        "total_count":  1
      }
    }
  end

  def self.example_show_response
    {
      "id":          1,
      "title":       "MacBook",
      "description": "Macbook from Apple",
      "category":    "Technology",
      "likes":       83,
      "taken_at":    "2023-11-17T12:43:40.344Z",
      "tags":        "macbook, apple, laptop"
    }
  end

  def self.example_create_response
    {
      "title":       "MacBook",
      "description": "Macbook from Apple",
      "category":    "Technology",
      "likes":       83,
      "taken_at":    "2023-11-17T12:43:40.344Z",
      "tags":        "macbook, apple, laptop"
    }
  end

  def self.example_update_response
    {
      "id":          1,
      "title":       "MacBook",
      "description": "Macbook from Apple",
      "category":    "Technology",
      "likes":       83,
      "taken_at":    "2023-11-17T12:43:40.344Z",
      "tags":        "macbook, apple, laptop"
    }
  end
end
