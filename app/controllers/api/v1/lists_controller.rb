class Api::V1::ListsController < ApplicationController
  respond_to :json
  before_action :set_board

  def index
    respond_with @board.lists
  end

  private

  def set_board
    @board = current_user.boards.find(list_params[:board_id])
  end

  def list_params
    params.permit(:title, :board_id)
  end
end
