class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :board
  ROLES = %i[owner admin normal]

  def roles=(roles)
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.sum
  end

  def roles
    ROLES.reject { |r| ((roles_mask || 0) & 2**ROLES.index(r)).zero? }
  end
end
