class Api::V1::UsersController < ApplicationController
  respond_to :json
  skip_before_filter :authenticate_user!, only: [:show]

  def index
    unless params[:search].empty?
      @users = User.where('name ilike ?', "%#{params[:search]}%")
      respond_with @users
    else
      respond_with User.new
    end
  end
  def show
    @user = User.find(params[:id])
    respond_with @user
  end
end
