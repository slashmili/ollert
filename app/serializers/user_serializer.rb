class UserSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :name, :username, :initials, :avatar
end
