class CardSerializer < ActiveModel::Serializer
  attributes :id, :title, :list_id, :position
end
