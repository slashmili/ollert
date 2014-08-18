class Board < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :lists
  belongs_to :user #creator
  has_many :memberships
  has_many :users, through: :memberships
  after_create :assign_admin
  after_create :create_default_list
  scope :accessible, lambda { |u| where('public = ? or user_id = ?', true, u.id) }

  def permission(user)
    memberships.where(user: user, board: self).first.roles
  end

  def assign_admin
    Membership.create(user: user, board: self, roles: %i[admin owner])
  end

  def create_default_list
    position = 0.0
    ['Todo', 'Doing', 'Done'].each do |title|
      position = (position + 1.0)/2
      lists.create(title: title, position: position)
    end
  end
end
