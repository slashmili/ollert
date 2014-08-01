class CommentSerializer < ActiveModel::Serializer
  attributes :id, :text, :created_at, :updated_at, :card_id, :user_id
end
