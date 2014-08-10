class Api::V1::ListsController < ApplicationController
  respond_to :json
  before_action :set_list, only: [:update]

  def index
    respond_with List.find(params[:ids])
  end

  def update
    update_params = list_params()
    #binding.pry
    if @after_list
      update_params[:position] = position(@after_list)
    end

    if @list.update(update_params)
        render json: @list, status: :ok
    else
        render json: @list, status: :unprocessable_entity
    end
  end

  def create
    @list = List.new(list_params)
    @list.position = list_params[:position] || position(@after_list)

    if @list.save
      render json: @list
    else
      render json: @list.errors, status: :unprocessable_entity
    end
  end

  private

  def set_list
    @list = current_user.lists.find(params[:id])
  end

  def position(after_list)
    unless after_list
      after_list = current_user.boards.find(list_params[:board_id]).lists.first
    end
    before_list = List.order(position: :asc).where(board_id: list_params[:board_id]).where('position < ?', after_list.position).last
    before_position = 0.0
    if before_list
      before_position = before_list.position
    end
    (after_list.position + before_position)/2
  end

  def list_params
    params.require(:list)
    if after_list_id = params[:list].delete(:before)
      @after_list = List.find(after_list_id)
    end
    params.require(:list).permit(:ids, :title, :board_id, :position, :before)
  end

end
