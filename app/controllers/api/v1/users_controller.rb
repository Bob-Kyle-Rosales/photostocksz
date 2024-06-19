# app/controllers/api/v1/users_controller.rb
class Api::V1::UsersController < Api::V1::BaseController
  api :GET, "/api/v1/users", "List all users with pagination"
  param :per_page, :number, desc: "Number of users per page", required: false
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"
  example <<-EOS
    {
      "users": [
        {
          "id": 1,
          "firstname": "John",
          "lastname": "John",
          "email": "rosalesbobkyle@gmail.com",
          "gender": "male",
          "photos": [
            {
              "id": 15,
              "title": "Digital Character",
              "description": "Fanart anime character",
              "category": "Cartoon",
              "likes": 1,
              "created_at": "2024-06-19T12:43:43.341Z",
              "updated_at": "2024-06-19T12:43:43.667Z",
              "tags": "digital, character, fanart",
              "taken_at": "2024-01-22T12:43:40.346Z",
              "user_id": 1
            },
            {
              "id": 18,
              "title": "Winnie the Pooh",
              "description": "Cute winnie the pooh",
              "category": "Cartoon",
              "likes": 66,
              "created_at": "2024-06-19T12:43:43.657Z",
              "updated_at": "2024-06-19T12:43:43.678Z",
              "tags": "winnie, pooh, cute",
              "taken_at": "2023-12-18T12:43:40.346Z",
              "user_id": 1
            },
            ...
          ]
        }
      ],
      "pagy": {
        "count": 1,
        "items": 10,
        "page": 1,
        "next": null,
        "prev": null,
        "last": 1
      }
    }
  EOS
  def index
    pagy, @users = pagy(User.includes(:photos), items: params[:per_page] || 10)
    render json: @users, each_serializer: UserSerializer, meta: pagy
  end

  api :GET, "/api/v1/users/:id", "Show a user by ID"
  param :id, :number, desc: "User ID", required: true
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"
  example <<-EOS
    {
      "id": 1,
      "firstname": "John",
      "lastname": "John",
      "email": "rosalesbobkyle@gmail.com",
      "gender": "male",
      "photos": [
        {
          "id": 15,
          "title": "Digital Character",
          "description": "Fanart anime character",
          "category": "Cartoon",
          "likes": 1,
          "created_at": "2024-06-19T12:43:43.341Z",
          "updated_at": "2024-06-19T12:43:43.667Z",
          "tags": "digital, character, fanart",
          "taken_at": "2024-01-22T12:43:40.346Z",
          "user_id": 1
        },
        ...
      ]
    }
  EOS
  def show
    @user = User.includes(:photos).find(params[:id])
    render json: @user, serializer: UserSerializer
  end
end
