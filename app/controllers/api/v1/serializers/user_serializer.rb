class Api::V1::Serializers::UserSerializer < Api::V1::Serializers::BaseUserSerializer
  has_many :photos, serializer: Api::V1::Serializers::PhotoSerializer
end
