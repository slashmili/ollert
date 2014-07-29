class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :card_id, :user_id
end
