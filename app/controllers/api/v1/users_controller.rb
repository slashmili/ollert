class Api::V1::UsersController < ApplicationController
  respond_to :json
  skip_before_filter :authenticate_user!, only: [:show]

  def show
    @user = User.find(params[:id])
    respond_with @user
  end
end
