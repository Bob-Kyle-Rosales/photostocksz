class PhotosController < ApplicationController
  include PhotoConcern
  before_action :set_photo, only: %i[show edit update destroy]

  def index
    super
    respond_to do |format|
      format.html # renders the default index.html.erb
      format.json { render json: @photos, each_serializer: PhotoSerializer }
    end
  end

  def show
    super
    respond_to do |format|
      format.html # renders the default show.html.erb
      format.json { render json: @photo, serializer: PhotoSerializer }
    end
  end

  def new
    @photo = Photo.new
  end

  def edit; end

  def create
    super
    respond_to do |format|
      if @photo.save
        format.html { redirect_to @photo, notice: "Photo was successfully created." }
        format.json { render :show, status: :created, location: @photo, serializer: PhotoSerializer }
      else
        format.html { render :new }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    super
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: "Photo was successfully updated." }
        format.json { render :show, status: :ok, location: @photo, serializer: PhotoSerializer }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    super
    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # private

  # def set_photo
  #   @photo = Photo.find(params[:id])
  # end

  # def photo_params
  #   params.require(:photo).permit(:title, :description, :category, :likes, :taken_at, :image, :tags)
  # end
end
