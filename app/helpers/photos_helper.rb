module PhotosHelper
    def photo_data_uri(photo)
      if photo.image.attached?
        image_data = photo.image.download
        image_mime_type = photo.image.content_type
        "data:#{image_mime_type};base64,#{Base64.strict_encode64(image_data)}"
      else
        # If no image is attached, return a placeholder image or empty string
        ""
      end
    end
  end
  