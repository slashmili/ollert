require "test_helper"

describe Api::V1::CommentsController do
  include Devise::TestHelpers

  let(:user) { create(:user) }
  let(:board) { create(:board, user: user) }
  let(:list_done) { board.lists.first }
  let(:card) { create(:card, list_id: list_done.id)}


  before do
    sign_in user
  end

  it "creats new" do
    post :create, comment: { text: 'This is my text', card_id: card.id, user_id: user.id}
    assigns(:comment).text.must_equal 'This is my text'
    assigns(:comment).user.must_equal user
    assigns(:comment).card.must_equal card
  end

  it 'shows comment' do
    comment = create(:comment, card_id: card.id, user_id: user.id)
    get :show, id: comment
    assert_response :success
  end

  it 'gets index' do
    comment = create(:comment, card_id: card.id, user_id: user.id)
    get :index, ids: [comment.id]
    assigns(:comments).length.must_equal 1
    assert_response :success
  end

end
