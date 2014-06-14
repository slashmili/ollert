class Board < ActiveRecord::Base
  validates :title, uniqueness: true
end
