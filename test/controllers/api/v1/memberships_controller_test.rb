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

  it "updates membership" do
    sign_in user

    new_member = create(:user)
    mem = Membership.create(user: new_member, board: board, roles: %w[normal])
    put :update, format: :json, id: mem, membership: { board_id: board.id, user_id: user.id, roles: ['admin'] }
    assigns(:membership).roles.must_equal %w[admin]
  end

  it "wont allow normal user change roles" do
    new_member = create(:user)
    mem = Membership.create(user: new_member, board: board, roles: %w[normal])

    sign_in new_member

    proc {
      put :update, format: :json, id: mem, membership: { board_id: board.id, user_id: user.id, roles:['admin'] }
    }.must_raise CanCan::AccessDenied
  end

  it "wont allow user without login to change" do
    new_member = create(:user)
    mem = Membership.create(user: new_member, board: board, roles: %w[normal])

    proc {
      put :update, format: :json, id: mem, membership: { board_id: board.id, user_id: user.id, roles:['admin'] }
    }.must_raise CanCan::AccessDenied
  end


  it "must allow admin user to remove a member" do
    sign_in user

    new_member = create(:user)
    mem = Membership.create(user: new_member, board: board, roles: %w[normal])
    delete :destroy, format: :json, id: mem
  end


  it "wont allow user without login to remove a member" do
    new_member = create(:user)
    mem = Membership.create(user: new_member, board: board, roles: %w[normal])

    proc {
      delete :destroy, format: :json, id: mem
    }.must_raise CanCan::AccessDenied
  end
end
