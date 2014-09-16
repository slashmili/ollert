require 'test_helper'

describe Board do
  let(:user) { create(:user) }
  let(:board) { create(:board, user_id: user.id) }

  it "must have default tags" do
    board.tags.must_equal JSON.parse(Board::TAGS.to_json)
  end

  it "wont save a board with the same name" do
    create(:board, :title => "Foo", user_id: user.id)
    lambda {create(:board, :title => "Foo", user_id: user.id)}.must_raise(ActiveRecord::RecordInvalid)
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

  it "wont allow a board with empty title" do
    lambda {create(:board, user_id: user.id, title: '')}.must_raise(ActiveRecord::RecordInvalid)
  end

  it "must allow two users have a board with same name" do
    sam = create(:user)

    board_joe = create(:board, user_id: user.id)
    board_sam = create(:board, user_id: sam.id, title: board_joe.title)

    board_joe.title.must_equal board_sam.title
  end

  it "must be able to mark a board to archive" do
    board = create(:board, user_id: user.id, public: true, archived: true)
    board.archived.must_equal true
  end
end
