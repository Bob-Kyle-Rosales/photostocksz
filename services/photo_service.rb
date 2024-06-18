class PhotoService
  def self.create(photo_params)
    photo = Photo.new(photo_params)
    if photo.save
      { success: true, photo: }
    else
      { success: false, errors: photo.errors }
    end
  end

  def self.update(photo, photo_params)
    # Convert tags string to array if necessary
    photo.tags = photo_params[:tags].split(",").map(&:strip) if photo_params[:tags].is_a?(String)

    if photo.update(photo_params)
      { success: true, photo: }
    else
      { success: false, errors: photo.errors }
    end
  end

  def self.destroy(photo)
    photo.destroy
  end
end
