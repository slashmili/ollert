class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :board_id
  has_many :cards, embed: :ids, embed_in_root: true
end
