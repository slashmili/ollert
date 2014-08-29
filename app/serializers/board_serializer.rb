class BoardSerializer < ActiveModel::Serializer
  attributes :id, :title, :public, :roles, :tags
  has_many :lists, embed: :ids
  has_many :memberships, embed: :ids
end
