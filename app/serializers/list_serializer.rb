class ListSerializer < ActiveModel::Serializer
  embed :ids, include: true
  attributes :id, :title, :board_id
  has_many :cards
  has_one :board
end
