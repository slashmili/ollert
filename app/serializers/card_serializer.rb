class CardSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :title, :list_id, :position, :description
  has_many :comments
end
