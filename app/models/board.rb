class Board < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :lists
  belongs_to :user #creator
  has_many :memberships
  has_many :users, through: :memberships
  before_create :set_default_tags
  after_create :assign_admin
  after_create :create_default_list
  scope :accessible, lambda { |u| where('public = ? or user_id = ?', true, u.id) }

  TAGS = %w[ green yellow orange red purple blue ]

  belongs_to :membership #nasty hack!
  def roles
    membership.try(:roles) || [:guest]
  end

  def can_read_by?(user)
    self.public? || memberships.where(user: user).first.try(:any_role?, %w[owner admin normal])
  end

  private
  def assign_admin
    Membership.create(user: user, board: self, roles: %w[admin owner])
  end

  def create_default_list
    position = 0.0
    ['Todo', 'Doing', 'Done'].each do |title|
      position = (position + 1.0)/2
      lists.create(title: title, position: position)
    end
  end

  def set_default_tags
    self.tags ||= TAGS
  end

end
