class Api::V1::CommentsController < ApplicationController
  respond_to :json

  def index
    @comments = current_user.comments.find(params[:ids])
    render json: @comments
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    if @comment.save
      render json: @comment
    else
      render json: @comment.errors, status: :unprocessable_entity
    end
  end

  def show
    @comment = current_user.comments.find(params[:id])
    render json: @comment, status: :ok
  end


  private

  def comment_params
    params.require(:comment).permit(:ids, :text, :card_id, :user_id)
  end
end
