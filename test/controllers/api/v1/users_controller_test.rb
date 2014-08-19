require "test_helper"

describe Api::V1::UsersController do
  include Devise::TestHelpers

  let(:user) { create(:user) }

  it "shows user" do
    sign_in user

    get :show, format: :json, id: user
    assigns(:user).must_equal user
  end
end
