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
end
