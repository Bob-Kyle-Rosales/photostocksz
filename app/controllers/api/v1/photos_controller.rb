
    class Api::V1::PhotosController < Api::V1::BaseController
      include Pagy::Backend
      include PhotoConcern
      before_action :set_photo, only: %i[show update destroy]

      def index
        super
        pagy, @photos = pagy(Photo.all, items: params[:per_page] || 10)
        render json: {
          photos: ActiveModelSerializers::SerializableResource.new(@photos, each_serializer: PhotoSerializer),
          meta: pagy_metadata(pagy)
        }
      end

      def show
        super
        render json: @photo, serializer: PhotoSerializer
      end

      def create
        super
        if @photo.save
          render json: @photo, serializer: PhotoSerializer, status: :created, location: api_v1_photo_url(@photo)
        else
          render json: @photo.errors, status: :unprocessable_entity
        end
      end

      def update
        super
        if @photo.update(photo_params)
          render json: @photo, serializer: PhotoSerializer, status: :ok, location: api_v1_photo_url(@photo)
        else
          render json: @photo.errors, status: :unprocessable_entity
        end
      end

      def destroy
        super
        head :no_content
      end

      private
      
      def pagy_metadata(pagy)
        {
          current_page: pagy.page,
          next_page: pagy.next,
          prev_page: pagy.prev,
          total_pages: pagy.pages,
          total_count: pagy.count
        }
      end
    end
