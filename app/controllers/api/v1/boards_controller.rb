class Api::V1::BoardsController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.boards
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user

    if @board.save
        render json: @board
    else
      render json: @board.errors, status: :unprocessable_entity
    end
  end

  private

  def board_params
    params.require(:board).permit(:title, :public)
  end

end
