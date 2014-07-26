class Api::V1::BoardsController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.boards
  end
end
