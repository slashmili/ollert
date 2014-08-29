class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :list_id, :position, :description, :tags
  has_many :comments, embed: :ids
end
