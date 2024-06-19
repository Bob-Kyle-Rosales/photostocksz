class UserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :gender, :photos
end
