class UserSerializer < BaseUserSerializer
  has_many :photos, serializer: PhotoSerializer
end
