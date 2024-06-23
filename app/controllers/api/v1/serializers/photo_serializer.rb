class Api::V1::Serializers::PhotoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :category, :likes, :taken_at, :tags

  belongs_to :user, serializer: Api::V1::Serializers::BaseUserSerializer
end
