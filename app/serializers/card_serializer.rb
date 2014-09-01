class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :list_id, :position, :description, :tags, :member_ids
  has_many :comments, embed: :ids
end
