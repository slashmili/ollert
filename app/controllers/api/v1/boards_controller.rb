class Api::V1::BoardsController < ApplicationController
  respond_to :json
  before_action :set_board, only: [:show]
  skip_before_filter :authenticate_user!, only: [:index, :show]

  def index
    if current_user
      respond_with current_user.boards
    else
      respond_with boards: []
    end
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

  def show
    render json: @board, status: :ok
  end


  private

  def set_board
    @board = Board.find(params[:id])
    authorize! :read, @board
  end

  def board_params
    params.require(:board).permit(:title, :public)
  end

end
