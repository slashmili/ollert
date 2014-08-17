require "test_helper"

describe BoardAccess do
  let(:board_access) { BoardAccess.new }

  it "must be valid" do
    board_access.must_be :valid?
  end

  it "must have three roles" do
    BoardAccess::ROLES.must_equal %i[owner admin normal]
  end

  it "must save a role" do
    user = create(:user)
    board = create(:board, user_id: user.id)
    board_access = create(:board_access, user_id: user.id, board_id: board.id)
    board_access.roles= %i[normal]
    board_access.roles.must_equal %i[normal]
  end
end
