class Api::V1::Serializers::BaseUserSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :email, :gender
end
