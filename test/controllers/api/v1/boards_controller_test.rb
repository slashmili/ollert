require "test_helper"

describe Api::V1::BoardsController do
  include Devise::TestHelpers

  before do
    @user = create(:user)
  end

  it "creates new" do
    sign_in @user
    post :create, board: { title: 'Foo board', public: true }
    assigns(:board).title.must_equal 'Foo board'
    assigns(:board).user.must_equal @user
    assigns(:board).id.wont_equal nil, "Board shoud be saved"
    assigns(:board).public.must_equal true
  end

  it "shows a board" do
    sign_in @user
    board = create(:board, user_id: @user.id)

    get :show, id: board
    assigns(:board).id.must_equal board.id
  end

  it "should be able to access to a public board" do
    sign_in @user
    user_foo = create(:user)
    board_foo = create(:board, user_id: user_foo.id, public: true)

    get :show, id: board_foo
    assigns(:board).id.must_equal board_foo.id
  end

  it "should show the board if user is not logged in" do
    user_foo = create(:user)
    board_foo = create(:board, user_id: user_foo.id, public: true)
    get :index, format: :json
    get :show, id: board_foo
    response.status.must_equal 200
  end


  it "should show empty board if user is not logged in" do
    get :index, format: :json
    response.status.must_equal 200
  end

end
