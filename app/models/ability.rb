class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, Board do |board|
      board.can_read_by? user
    end

    can :read, List do |list|
      list.can_read_by? user
    end

    can :edit, List do |list|
      list.can_edit_by? user
    end

    can :edit, Card do |card|
      card.can_edit_by? user
      card.list.board.memberships.where(user: user).first.any_role?(%w[owner admin normal])
    end

    can :read, Card do |card|
      card.can_read_by? user
    end

    can :create, Membership do |mem|
      mem.can_edit_by? user
    end

    can :read, Membership do |mem|
      mem.can_read_by? user
    end

    can :edit, Membership do |mem|
      mem.can_edit_by? user
    end

    can :destroy, Membership do |mem|
      mem.can_destroy_by? user
    end
  end
end
