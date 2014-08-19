class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Board do |board|
      board.public? || board.memberships.where(user: user).first.any_role?(%i[owner admin normal])
    end

    can :read, List do |list|
      list.board.public? || list.board.memberships.where(user: user).first.any_role?(%i[owner admin normal])
    end

    can :edit, List do |list|
      list.board.memberships.where(user: user).first.any_role?(%i[owner admin normal])
    end

    can :edit, Card do |card|
      card.list.board.memberships.where(user: user).first.any_role?(%i[owner admin normal])
    end

    can :read, Card do |card|
      #TODO: fix n+1 issue
      card.list.board.public? || card.list.board.memberships.where(user: user).first.any_role?(%i[owner admin normal])
    end
  end
end
