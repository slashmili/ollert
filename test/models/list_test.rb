require "test_helper"

describe List do
  let(:user) { create(:user) }
  let(:board) { create(:board, user_id: user.id) }


  it "must be readable for all if board is public" do
    board.public = true
    board.save
    board.lists.first.can_read_by?(nil).must_equal true
  end

  it "must be readable for the owner" do
    board.lists.first.can_read_by?(user).must_equal true
  end

  it "must be editable for the owner" do
    board.lists.first.can_edit_by?(user).must_equal true
  end
end
