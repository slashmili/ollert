class Board < ActiveRecord::Base
  validates :title, uniqueness: true
  has_many :list

  after_create :create_default_list

  def create_default_list
    l = List.create(title:"To Do", board: self)
    l = List.create(title:"Doing", board: self)
    l = List.create(title:"Done", board: self)
  end
end
