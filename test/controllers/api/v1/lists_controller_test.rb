require "test_helper"

describe Api::V1::ListsController do
  include Devise::TestHelpers

  let(:board) { create(:board) }
  let(:list_done) { board.lists.first }


  before do
    @user = create(:user)
    sign_in @user
  end

  it "creates new" do
    board.user = @user
    board.save
    post :create, list: {title: 'Wish list', board_id: board.id, position: 3}
    assigns(:list).title.must_equal 'Wish list'
    assigns(:list).id.wont_equal nil, "Card shoud be saved"
    assigns(:list).position.must_equal 3
  end

  it "creates new one in after doing list" do
    board.user = @user
    board.save
    done_list = board.lists.last
    post :create, list: {title: 'QA', board_id: board.id, before: done_list}
    board.lists.order(position: :asc)[2].must_equal assigns(:list)
    board.lists.order(position: :asc).last.must_equal done_list
  end


  it "creates new one at top of the list" do
    board.user = @user
    board.save
    todo_list = board.lists.first
    post :create, list: {title: 'QA', board_id: board.id, before: todo_list}
    board.lists.order(position: :asc).first.must_equal assigns(:list)
    board.lists.order(position: :asc)[1].must_equal todo_list
  end

  it "creates new one at the end of the list" do
    board.user = @user
    board.save
    post :create, list: {title: 'QA', board_id: board.id, before: 0}
    board.lists.order(position: :asc).last.must_equal assigns(:list)
  end

  it "moves todo list to the middle the list" do
    board.user = @user
    board.save
    todo_list = board.lists.first
    put :update, id: todo_list, list: { board_id: board.id, before: board.lists.last }
    board.lists.order(position: :asc)[1].must_equal todo_list
  end

  it "moves todo list to the end of the list" do
    board.user = @user
    board.save
    todo_list = board.lists.first
    put :update, id: todo_list, list: { board_id: board.id, before: 0 }
    board.lists.order(position: :asc).last.must_equal todo_list
  end

end
