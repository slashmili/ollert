class Card < ActiveRecord::Base
  default_scope { order("cards.position ASC") }
  belongs_to :list
  has_many :comments
  before_create :set_default_members

  def can_read_by?(user)
    list.can_read_by? user
  end

  def can_edit_by?(user)
    list.can_edit_by? user
  end

  def member_ids
    members
  end

  private

  def set_default_members
    self.members = []
  end
end
