class BoardsController < ApplicationController
  before_action :set_board, only: [:show]
  def index
    @boards = current_user.boards.all
  end
  private

  def set_board
    @board = current_user.boards.find(params[:id])
    redirect_to new_user_session unless @board
  end

  def board_params
    params.require(:board).permit(:title)
  end
end
