class BoardSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :title, :public
  has_many :lists
end
