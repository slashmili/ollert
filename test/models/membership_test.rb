require "test_helper"

describe Membership do
  let(:board_access) { Membership.new }

  it "must be valid" do
    board_access.must_be :valid?
  end

  it "must have three roles" do
    Membership::ROLES.must_equal %w[owner admin normal]
  end

  it "must save a role" do
    user = create(:user)
    board = create(:board, user_id: user.id)
    board_access = create(:membership, user_id: user.id, board_id: board.id)
    board_access.roles= %w[normal]
    board_access.roles.must_equal %w[normal]
  end

  it "must be readable by it's own user" do
    user = create(:user)
    board = create(:board, user_id: user.id)
    user.boards.first.membership.can_read_by? user
  end

  it "must be readable if board is public" do
    user = create(:user)
    board = create(:board, user_id: user.id, public: true)
    user.boards.first.membership.can_read_by? nil
  end
end
