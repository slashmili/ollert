class Api::V1::ListsController < ApplicationController
  respond_to :json

  def index
    respond_with List.find(params[:ids])
  end

  def create
    @list = List.new(list_params)

    if @list.save
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  private
  def list_params
    params.require(:list).permit(:ids, :title, :board_id)
  end

end
