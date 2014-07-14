class ListSerializer < ActiveModel::Serializer
  attributes :id, :title, :board_id
  has_many :cards
end
