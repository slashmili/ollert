class Card < ActiveRecord::Base
  default_scope { order("position ASC") }
  belongs_to :list
  has_many :comments
end
