require "test_helper"

describe Api::V1::CardsController do
  include Devise::TestHelpers

  let(:board) { create(:board) }
  let(:list_done) { board.lists.first }
  #let(:card) { create(:card, list_id: list_done.id)}


  before do
    @user = create(:user)
    sign_in @user
  end

  it "creats new" do
    board.user = @user
    board.save
    post :create, card: { title: 'Lets do it', list_id: list_done.id }
    assigns(:card).title.must_equal 'Lets do it'
    assigns(:card).id.wont_equal nil, "Card shoud be saved"
  end

  it "shouldnt be saved because the user dosnt own the board" do
    proc {
      post :create, card: { title: 'Lets do it', list_id: list_done.id }
    }.must_raise ActiveRecord::RecordNotFound
  end

  it "updates card" do
    board.user = @user
    board.save
    card = create(:card, list_id: list_done.id)
    put :update, id: card, card: { list_id: list_done.id, position: 1000, title: 'updates card' }
    assigns(:card).title.must_equal 'updates card'
    assigns(:card).position.must_equal 1000
  end

  it "shows card" do
    board.user = @user
    board.save
    card = create(:card, list_id: list_done.id)
    get :show, id: card
    assert_response :success
  end


end
