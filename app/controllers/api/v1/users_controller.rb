class Api::V1::UsersController < Api::V1::BaseController
  include Api::V1::ApiHelper::UserHelper
  before_action :set_user, only: %i[show liked_photos]

  api :GET, "/api/v1/users", "List all users with pagination"
  param :per_page, :number, desc: "Number of users per page", required: false
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"
  example JSON.pretty_generate(Api::V1::ApiHelper::UserHelper.example_index_response)

  def index
    pagy, @users = pagy(User.includes(:photos), items: params[:per_page] || 10)
    render json: @users, each_serializer: Api::V1::Serializers::UserSerializer, meta: pagy
  end

  api :GET, "/api/v1/users/:id", "Show a user by ID"
  param :id, :number, desc: "User ID", required: true
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"
  example JSON.pretty_generate(Api::V1::ApiHelper::UserHelper.example_show_response)

  def show
    @user = User.includes(:photos).find(params[:id])
    render json: @user, serializer: Api::V1::Serializers::UserSerializer
  end

  api :GET, "/api/v1/users/:id/liked_photos", "Show a user's liked photos"
  param :id, :number, desc: "User ID", required: true
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"
  example JSON.pretty_generate(Api::V1::ApiHelper::UserHelper.example_liked_photos_response)

  def liked_photos
    @liked_photos = @user.user_likes.includes(:photo).map(&:photo)
    render json: @liked_photos
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
