require 'test_helper'



describe Board do
  let(:user) { create(:user) }
  let(:board) { create(:board, user_id: user.id) }
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
    user.memberships.where(board: board).first.roles.must_equal %w[owner admin]
  end

  it "must be able to assing a board to another user" do
    board = create(:board, user_id: user.id)
    new_member = create(:user)

    Membership.create(board: board, user: new_member, roles: %w[normal])

    new_member.boards.first.must_equal board
    new_member.boards.first.roles.must_equal %w[normal]
  end

  it "must consider roles as :guest if it's not connected to any account" do
    board = create(:board, user_id: user.id, public: true)
    board.roles.must_equal %i[guest]
    board.can_read_by?(nil).must_equal true
  end

  it "must be readable for the owner" do
    board.can_read_by?(user).must_equal true
  end

end
