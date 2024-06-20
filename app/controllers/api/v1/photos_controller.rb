class Api::V1::PhotosController < Api::V1::BaseController
  include PhotoConcern
  skip_before_action :verify_authenticity_token
  before_action :set_photo, only: %i[show update destroy like unlike]

  resource_description do
    short "Photos management"
    description "API for managing photos"
  end

  api :GET, "api/v1/photos", "List all photos"
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"
  param :page, :number, desc: "Page number for pagination"
  param :per_page, :number, desc: "Number of photos per page"
  example <<-EOS
    {
      "photos": [
        {
          "id": 1,
          "title": "MacBook",
          "description": "Macbook from Apple",
          "category": "Technology",
          "likes": 83,
          "taken_at": "2023-11-17T12:43:40.344Z",
          "tags": "macbook, apple, laptop"
        }
      ],
      "meta": {
        "current_page": 1,
        "next_page": null,
        "prev_page": null,
        "total_pages": 1,
        "total_count": 1
      }
    }
  EOS
  def index
    pagy, @photos = pagy(Photo.all, items: params[:per_page] || 10)
    render json: {
      photos: ActiveModelSerializers::SerializableResource.new(@photos,
                                                               each_serializer: PhotoSerializer),
      meta:   pagy_metadata(pagy)
    }
  end

  api :GET, "/v1/photos/:id", "Show a photo"
  param :id, :number, desc: "ID of the photo"
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"
  example <<-EOS
    {
      "id": 1,
      "title": "MacBook",
      "description": "Macbook from Apple",
      "category": "Technology",
      "likes": 83,
      "taken_at": "2023-11-17T12:43:40.344Z",
      "tags": "macbook, apple, laptop"
    }
  EOS
  def show
    render json: @photo, serializer: PhotoSerializer
  end

  api :POST, "/v1/photos", "Create a photo"
  param :title, String, desc: "Title of the photo", required: true
  param :description, String, desc: "Description of the photo", required: true
  param :category, String, desc: "Category of the photo", required: true
  param :tags, String, desc: "Tags for the photo", required: true
  param :taken_at, DateTime, desc: "Date and time when the photo was taken", required: true
  param :image, File, desc: "Image file", required: true
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"
  example <<-EOS
    {
      "id": 1,
      "title": "MacBook",
      "description": "Macbook from Apple",
      "category": "Technology",
      "likes": 83,
      "taken_at": "2023-11-17T12:43:40.344Z",
      "tags": "macbook, apple, laptop"
    }
  EOS
  def create
    @photo = Photo.new(photo_params)
    if @photo.save
      render json: @photo, serializer: PhotoSerializer, status: :created,
             location: api_v1_photo_url(@photo)
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  api :PUT, "/v1/photos/:id", "Update a photo"
  param :id, :number, desc: "ID of the photo"
  param :title, String, desc: "Title of the photo", required: true
  param :description, String, desc: "Description of the photo", required: true
  param :category, String, desc: "Category of the photo", required: true
  param :tags, String, desc: "Tags for the photo", required: true
  param :taken_at, DateTime, desc: "Date and time when the photo was taken", required: true
  param :image, File, desc: "Image file", required: true
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"
  example <<-EOS
    {
      "id": 1,
      "title": "MacBook",
      "description": "Macbook from Apple",
      "category": "Technology",
      "likes": 83,
      "taken_at": "2023-11-17T12:43:40.344Z",
      "tags": "macbook, apple, laptop"
    }
  EOS
  def update
    if @photo.update(photo_params)
      render json: @photo, serializer: PhotoSerializer, status: :ok,
             location: api_v1_photo_url(@photo)
    else
      render json: @photo.errors, status: :unprocessable_entity
    end
  end

  api :DELETE, "/v1/photos/:id", "Delete a photo"
  param :id, :number, desc: "ID of the photo"
  returns code: 200, desc: "Ok"
  returns code: 204, desc: "No Content"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 403, desc: "Forbidden"
  returns code: 404, desc: "Not Found"
  returns code: 500, desc: "Internal Server Error"
  example <<-EOS
    {
      "status": "success"
    }
  EOS
  def destroy
    @photo.destroy
    head :no_content
  end

  api :POST, "/api/v1/photos/:id/like", "Like a photo"
  param :id, :number, desc: "Photo ID", required: true
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 500, desc: "Internal Server Error"
  def like
    if @photo.user_likes.where(user_id: current_user.id).exists?
      render json: { error: "Photo already liked" }, status: :unprocessable_entity
    else
      like = @photo.user_likes.build(user: current_user)
      if like.save
        render json: @photo, status: :created
      else
        render json: like.errors, status: :unprocessable_entity
      end
    end
  end

  api :DELETE, "/api/v1/photos/:id/unlike", "Unlike a photo"
  param :id, :number, desc: "Photo ID", required: true
  returns code: 200, desc: "Ok"
  returns code: 400, desc: "Bad Request"
  returns code: 401, desc: "Unauthorized"
  returns code: 500, desc: "Internal Server Error"
  def unlike
    like = @photo.user_likes.find_by(user_id: current_user.id)
    if like
      like.destroy
      head :no_content
    else
      render json: { error: "Photo not liked" }, status: :unprocessable_entity
    end
  end

  private

  def pagy_metadata(pagy)
    {
      current_page: pagy.page,
      next_page:    pagy.next,
      prev_page:    pagy.prev,
      total_pages:  pagy.pages,
      total_count:  pagy.count
    }
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :category, :tags, :taken_at, :image,
                                  :user_id)
  end

  def set_photo
    @photo = Photo.find(params[:id])
  end
end
