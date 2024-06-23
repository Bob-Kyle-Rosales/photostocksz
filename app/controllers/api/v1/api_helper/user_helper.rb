module Api
  module V1
    module ApiHelper
      module UserHelper
        def self.example_show_response
          {
            "id":        1,
            "firstname": "John",
            "lastname":  "John",
            "email":     "rosalesbobkyle@gmail.com",
            "gender":    "male",
            "photos":    [
              {
                "id":          15,
                "title":       "Digital Character",
                "description": "Fanart anime character",
                "category":    "Cartoon",
                "likes":       1,
                "tags":        "digital, character, fanart",
                "taken_at":    "2024-01-22T12:43:40.346Z",
                "user_id":     1
              }
            ]
          }
        end

        def self.example_index_response
          {
            "users": [
              {
                "id":        1,
                "firstname": "John",
                "lastname":  "John",
                "email":     "rosalesbobkyle@gmail.com",
                "gender":    "male",
                "photos":    [
                  {
                    "id":          15,
                    "title":       "Digital Character",
                    "description": "Fanart anime character",
                    "category":    "Cartoon",
                    "likes":       1,
                    "tags":        "digital, character, fanart",
                    "taken_at":    "2024-01-22T12:43:40.346Z",
                    "user_id":     1
                  }
                ]
              }
            ],
            "pagy":  {
              "count": 1,
              "items": 10,
              "page":  1,
              "next":  nil,
              "prev":  nil,
              "last":  1
            }
          }
        end

        def self.example_liked_photos_response
          [
            {
              "id":          1,
              "title":       "MacBook",
              "description": "Macbook from Apple",
              "category":    "Technology",
              "likes":       [
                {
                  "id":       1,
                  "user_id":  1,
                  "photo_id": 1
                }
              ],
              "taken_at":    "2023-11-17T12:43:40.344Z",
              "tags":        "macbook, apple, laptop"
            }
          ]
        end
      end
    end
  end
end
