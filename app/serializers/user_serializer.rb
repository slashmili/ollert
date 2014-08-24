class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :username, :initials, :avatar
end
