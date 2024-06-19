module PhotoConcern
  extend ActiveSupport::Concern

  included do
    before_action :set_photo, only: %i[show update destroy]
  end

  def index
    @photos = Photo.all
  end

  def show; end

  def create
    # @photo = Photo.new(photo_params)
    @photo = current_user.photos.new(photo_params)
  end

  def update
    @photo.tags = photo_params[:tags].split(",").map(&:strip) if photo_params[:tags].is_a?(String)
  end

  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to photos_url, notice: "Photo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def photo_params
    params.require(:photo).permit(:title, :description, :category, :likes, :taken_at, :image,
                                  :tags)
  end
end
