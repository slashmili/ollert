class Api::V1::BoardsController < ApplicationController
  respond_to :json

  def index
    respond_with current_user.boards
  end

  def show
    respond_with board
  end

  def create
    respond_with :api, :v1, Board.create(lead_params)
  end

  def update
    respond_with board.update(lead_params)
  end

  def destroy
    respond_with board.destroy
  end

  private

  def lead
    Board.find(params[:id])
  end

  def lead_params
    params.require(:lead).permit(:title)
  end

end
