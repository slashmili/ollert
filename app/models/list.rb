class List < ActiveRecord::Base
  default_scope { order("lists.position ASC") }
  belongs_to :board
  has_many :cards
end
