class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Board do |board|
      board.public? || board.user == user
    end

    can :read, List do |list|
      list.board.public? || list.board.user == user
    end
  end
end
