class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :list_id, :position, :description
  has_many :comments, embed: :ids
end
