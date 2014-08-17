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

    can :edit, List do |list|
      list.board.user == user
    end

    can :edit, Card do |card|
      card.list.board.user == user
    end

    can :read, Card do |card|
      #TODO: fix n+1 issue
      card.list.board.user == user || card.list.board.public?
    end
  end
end
