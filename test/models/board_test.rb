require 'test_helper'



describe Board do
  let(:user) { create(:user) }
  it "wont save a board with the same name" do
    Board.create!(:title => "Foo", user_id: user.id)
    lambda {Board.create!(:title => "Foo")}.must_raise(ActiveRecord::RecordInvalid)
  end

  it "must create 3 list immediately after creation of new board" do
    board_with_3_lists = Board.create!(:title => "Foo with 3 boards", user_id: user.id)
    board_with_3_lists.lists.count.must_equal(3)
  end

  it "must assign the admin on creating" do
    board = create(:board, user_id: user.id)
    user.board_accesses.where(board: board).first.roles.must_equal %i[owner admin]
  end

  it "must be able to assing a board to another user" do
    board = create(:board, user_id: user.id)
    new_member = create(:user)

    board.board_accesses.create(board: board, user: new_member, roles: %i[normal])

    new_member.boards.first.must_equal board
    new_member.boards.first.permission(new_member).must_equal %i[normal]
  end
end
