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
    user = create(:user)
    board = create(:board, user_id: user.id)

    user.board_accesses.find(board.id).roles.must_equal %w[owner admin]

  end
end
