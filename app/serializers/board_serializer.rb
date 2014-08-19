class BoardSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :title, :public, :roles
  has_many :lists
  has_many :memberships
end
