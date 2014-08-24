class MembershipSerializer < ActiveModel::Serializer
  attributes :id, :board_id, :user_id, :roles
end
