class List < ActiveRecord::Base
  default_scope { order("lists.position ASC") }
  belongs_to :board
  has_many :cards


  def can_read_by?(user)
    board.can_read_by? user
  end

  def can_edit_by?(user)
    board.memberships.where(user: user).first.any_role?(%i[owner admin normal])
  end
end
