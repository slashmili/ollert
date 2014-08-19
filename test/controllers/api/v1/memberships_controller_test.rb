require "test_helper"

describe Api::V1::MembershipsController do
  include Devise::TestHelpers

  let(:user) { create(:user) }
  let(:board) { create(:board, user_id: user.id) }

  it "shows memberships" do
    sign_in user

    mem_id = board.memberships.where(user: user).first.id
    get :index, format: :json, ids: [mem_id]
    assigns(:memberships).first.id.must_equal mem_id
  end
end
