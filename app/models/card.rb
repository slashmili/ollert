class Card < ActiveRecord::Base
  default_scope { order("cards.position ASC") }
  belongs_to :list
  has_many :comments
end
