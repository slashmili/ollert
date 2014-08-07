require "test_helper"

describe Api::V1::ListsController do
  include Devise::TestHelpers

  let(:board) { create(:board) }
  let(:list_done) { board.lists.first }


  before do
    @user = create(:user)
    sign_in @user
  end

  it "creats new" do
    board.user = @user
    board.save
    post :create, list: { title: 'Wish list', board_id: board.id}
    assigns(:list).title.must_equal 'Wish list'
    assigns(:list).id.wont_equal nil, "Card shoud be saved"
  end

end
