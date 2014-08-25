require "test_helper"

describe Card do
  let(:user) { create(:user) }
  let(:board) { create(:board, user_id: user.id) }
  let(:card) { create(:card, list_id: board.lists.first.id) }

  it "must be readable for the owner" do
    card.can_read_by?(user).must_equal true
  end

  it "must be editable for the owner" do
    card.can_edit_by?(user).must_equal true
  end

  it "must be readable for all if board is public" do
    board.public = true
    board.save
    card.can_read_by?(nil).must_equal true
  end

  it "must save the tags that are available in board" do
    card.tags = [{color:'red', name:''}]
    card.save
    card.tags.must_equal [{'color' => 'red', 'name' => ''}]
  end

end
