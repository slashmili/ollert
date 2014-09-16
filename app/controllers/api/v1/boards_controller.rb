class Api::V1::BoardsController < ApplicationController
  respond_to :json
  before_action :set_board, only: [:show]
  skip_before_filter :authenticate_user!, only: [:index, :show]

  def index
    @boards = []
    if current_user
      @boards = current_user.boards
    end
    respond_with @boards
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
    if current_user
      @board = current_user.boards.find_by_id(params[:id]) || Board.find(params[:id])
    else
      @board = Board.find(params[:id])
    end
    authorize! :read, @board
  end

  def board_params
    params.require(:board).permit(:title, :public)
  end

end
