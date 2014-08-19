require "test_helper"

describe Api::V1::ListsController do
  include Devise::TestHelpers

  let(:user) { create(:user) }
  let(:board) { create(:board, user_id: user.id) }
  let(:list_done) { board.lists.first }


  before do
    @user = user
  end

  it "creates new" do
    sign_in @user
    post :create, list: {title: 'Wish list', board_id: board.id, position: 3}
    assigns(:list).title.must_equal 'Wish list'
    assigns(:list).id.wont_equal nil, "Card shoud be saved"
    assigns(:list).position.must_equal 3
  end

  it "creates new one in after doing list" do
    sign_in @user
    done_list = board.lists.last
    post :create, list: {title: 'QA', board_id: board.id, before: done_list}
    board.lists.order(position: :asc)[2].must_equal assigns(:list)
    board.lists.order(position: :asc).last.must_equal done_list
  end


  it "creates new one at top of the list" do
    sign_in @user
    todo_list = board.lists.first
    post :create, list: {title: 'QA', board_id: board.id, before: todo_list}
    board.lists.order(position: :asc).first.must_equal assigns(:list)
    board.lists.order(position: :asc)[1].must_equal todo_list
  end

  it "creates new one at the end of the list" do
    sign_in @user
    post :create, list: {title: 'QA', board_id: board.id, before: 0}
    board.lists.order(position: :asc).last.must_equal assigns(:list)
  end

  it "moves todo list to the middle the list" do
    sign_in @user
    todo_list = board.lists.first
    put :update, id: todo_list, list: { board_id: board.id, before: board.lists.last }
    board.lists.order(position: :asc)[1].must_equal todo_list
  end

  it "moves todo list to the end of the list" do
    sign_in @user
    todo_list = board.lists.first
    put :update, id: todo_list, list: { board_id: board.id, before: 0 }
    board.lists.order(position: :asc).last.must_equal todo_list
  end


  it "should be able to access to own board's lists" do
    sign_in @user

    get :index, format: :json, ids: [board.lists.first.id]
    response.status.must_equal 200
    assigns(:lists).length.must_equal 1
  end

  it "should be able to access to a public board's lists" do
    user_foo = create(:user)
    board_foo = create(:board, user_id: user_foo.id, public: true)

    get :index, format: :json, ids: [board_foo.lists.first.id]
    response.status.must_equal 200
    assigns(:lists).length.must_equal 1
  end

  it "shouldn't show the private boards to other users" do
    skip "Find another way to test this!"
    user_foo = create(:user)
    board_foo = create(:board, user_id: user_foo.id, public: false)
    proc {
      get :index, format: :json, ids: [board_foo.lists.first.id]
    }.must_throw CanCan::AccessDenied
  end



end
