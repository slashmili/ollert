require "test_helper"

describe Comment do
  let(:comment) { Comment.new }

  it "must have text" do
    comment.must_respond_to :text
  end

  it "must have user_id" do
    comment.must_respond_to :user_id
  end

  it "must have card_id" do
    comment.must_respond_to :card_id
  end
end
