class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category, :likes, :taken_at, :tags

  belongs_to :user, serializer: BaseUserSerializer
end
