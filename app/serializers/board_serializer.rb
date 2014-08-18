class BoardSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :title, :public, :roles
  has_many :lists
end
