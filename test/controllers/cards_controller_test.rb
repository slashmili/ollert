require "test_helper"

describe CardsController do

  let(:board) { Board.create!(title:'Foo with card') }
  let(:list_done) { board.lists.first }
  let(:card) { cards :one }

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
    put :update, id: card, card: { list_id: list_done.id, title: 'updates card' }
    assert_redirected_to card_path(assigns(:card))
  end

  it "destroys card" do
    assert_difference('Card.count', -1) do
      delete :destroy, id: card
    end

    assert_redirected_to cards_path
  end

end