class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  ROLES = %w[owner admin normal]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end

  def any_role?(roles)
    roles.each do |r|
      return true if self.roles.include? r
    end
    return false
  end

  def can_read_by?(user)
    board.can_read_by? user
  end

  def can_edit_by?(user)
    return false unless user
    membership = user.boards.where(id: board.id).first.try(:membership)
    membership && membership.any_role?(%w[admin])
  end

  def can_destroy_by?(user)
    can_edit_by? user
  end

  def can_create_by?(user)
    can_edit_by? user
  end

end
