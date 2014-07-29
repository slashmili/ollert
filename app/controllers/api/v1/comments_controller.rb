class Api::V1::CommentsController < ApplicationController
  respond_to :json

  def create
    @comment = Comment.new(comment_params)

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
    params.require(:comment).permit(:id, :text, :card_id, :user_id)
  end
end
