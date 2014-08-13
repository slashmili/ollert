class Board < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :lists
  belongs_to :user
  after_create :create_default_list
  scope :accessible, lambda { |u| where('public = ? or user_id = ?', true, u.id) }

  def create_default_list
    position = 0.0
    ['Todo', 'Doing', 'Done'].each do |title|
      position = (position + 1.0)/2
      lists.create(title: title, position: position)
    end
  end
end
