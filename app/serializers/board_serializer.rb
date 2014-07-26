class BoardSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :title
  has_many :lists
end
