require "test_helper"

describe Api::V1::CardsController do
  include Devise::TestHelpers

  let(:user) { create(:user) }
  let(:board) { create(:board, user_id: user.id) }
  let(:list_done) { board.lists.first }
  #let(:card) { create(:card, list_id: list_done.id)}

  before do
    @user = user
    sign_in @user
  end

  it "creates new" do
    board.user = @user
    board.save
    post :create, card: { title: 'Lets do it', list_id: list_done.id, description: 'description', tags: %w[green] }
    assigns(:card).title.must_equal 'Lets do it'
    assigns(:card).id.wont_equal nil, "Card shoud be saved"
    assigns(:card).description.must_equal 'description'
    assigns(:card).tags.must_equal %w[green]
    assigns(:card).members.must_equal []
  end

  it "shouldnt be saved because the user dosnt own the board" do
    new_user = create(:user)
    sign_in new_user
    proc { post :create, card: { title: 'Lets do it', list_id: list_done.id } }.must_raise ActiveRecord::RecordNotFound
  end

  it "updates card" do
    board.user = @user
    board.save
    card = create(:card, list_id: list_done.id, tags: %w[ green ], members:[0])
    card.tags.must_equal %w[ green ], "Card must have #green tag"
    put :update, id: card, card: { list_id: list_done.id, position: 1000, title: 'updates card', tags: [], member_ids: [] }
    assigns(:card).title.must_equal 'updates card'
    assigns(:card).position.must_equal 1000
    assigns(:card).tags.must_equal []
    assigns(:card).members.must_equal []
  end

  it "shows card" do
    board.user = @user
    board.save
    card = create(:card, list_id: list_done.id)
    get :show, id: card
    assert_response :success
  end

end
