class MembershipSerializer < ActiveModel::Serializer
  embed :ids
  attributes :id, :board_id, :user_id, :roles
end
