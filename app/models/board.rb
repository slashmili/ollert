class Board < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :lists

  after_create :create_default_list

  def create_default_list
    ['Todo', 'Doing', 'Done'].each{|title| lists.create(title: title) }
  end
end
