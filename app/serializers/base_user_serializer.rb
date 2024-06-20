class BaseUserSerializer < ActiveModel::Serializer
    attributes :id, :firstname, :lastname, :email, :gender
  end