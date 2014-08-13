require "test_helper"

describe Api::V1::BoardsController do
  include Devise::TestHelpers

  before do
    @user = create(:user)
    sign_in @user
  end

  it "creats new" do
    post :create, board: { title: 'Foo board', public: true }
    assigns(:board).title.must_equal 'Foo board'
    assigns(:board).user.must_equal @user
    assigns(:board).id.wont_equal nil, "Board shoud be saved"
    assigns(:board).public.must_equal true
  end
end
