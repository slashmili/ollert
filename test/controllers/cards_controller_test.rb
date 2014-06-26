require "test_helper"





describe CardsController do
  include Devise::TestHelpers

  let(:board) { FactoryGirl.create(:board) }
  let(:list_done) { board.lists.first }
  let(:card) { FactoryGirl.create(:card, list_id: list_done.id)}

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end

  it "gets index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cards)
  end

  it "gets new" do
    get :new
    assert_response :success
  end

  it "creates card" do
    skip
    FactoryGirl.create(:card)
    FactoryGirl.create(:card)
    assert_difference('Card.count') do
      post :create, card: { list_id: list_done.id, title: 'creates card' }
    end

    assert_redirected_to card_path(assigns(:card))
  end

  it "shows card" do
    get :show, id: card
    assert_response :success
  end

  it "gets edit" do
    get :edit, id: card
    assert_response :success
  end

  it "updates card" do
    skip
    put :update, id: card, card: { list_id: list_done.id, title: 'updates card' }
    assert_redirected_to card_path(assigns(:card))
  end

  it "destroys card" do
    skip
    assert_difference('Card.count', -1) do
      delete :destroy, id: card
    end

    assert_redirected_to cards_path
  end

end
