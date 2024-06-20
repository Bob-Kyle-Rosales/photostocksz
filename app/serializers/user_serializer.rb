class BaseUserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :gender
end

class UserSerializer < BaseUserSerializer
  has_many :photos, serializer: PhotoSerializer
end
