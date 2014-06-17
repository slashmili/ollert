class Board < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :list

  after_create :create_default_list

  def create_default_list
    ['Todo', 'Doing', 'Done'].each{|title| list.create(title: title) }
  end
end
