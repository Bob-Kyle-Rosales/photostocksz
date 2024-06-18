class Api::V1::PhotosController < Api::V1::BaseController
  before_action :set_photo, only: %i[show update destroy]
  
  api :GET, "/api/v1/users", "Get users list"
  returns code: 200, desc: "Ok"
  def index
    @photos = Photo.all
    render json: @photos, each_serializer: PhotoSerializer
  end

  def show
    render json: @photo, serializer: PhotoSerializer
  end

  def create
    result = PhotoService.create(photo_params)
    if result[:success]
      render json: result[:photo], serializer: PhotoSerializer, status: :created, location: api_v1_photo_url(result[:photo])
    else
      render json: result[:errors], status: :unprocessable_entity
    end
  end

  def update
    result = PhotoService.update(@photo, photo_params)
    if result[:success]
      render json: result[:photo], serializer: PhotoSerializer, status: :ok, location: api_v1_photo_url(result[:photo])
    else
      render json: result[:errors], status: :unprocessable_entity
    end
  end

  def destroy
    PhotoService.destroy(@photo)
    head :no_content
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :category, :likes, :taken_at, :image, :tags)
  end
end
