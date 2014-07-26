require "test_helper"

describe Api::V1::BoardsController do
  include Devise::TestHelpers

  before do
    @user = create(:user)
    sign_in @user
  end

  it "creats new" do
    post :create, board: { title: 'Foo board' }
    assigns(:board).title.must_equal 'Foo board'
    assigns(:board).user.must_equal @user
    assigns(:board).id.wont_equal nil, "Board shoud be saved"
  end
end
