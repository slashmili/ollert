class Api::V1::CommentsController < ApplicationController
  respond_to :json
  before_action :set_comment, only: [:update, :show]

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
    render json: @comment, status: :ok
  end

  def update
    if @comment.update(comment_params)
        render json: @comment, status: :ok
    else
        render json: @comment.errors, status: :unprocessable_entity
    end
  end



  private
  def set_comment
    @comment = current_user.comments.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:ids, :text, :card_id, :user_id)
  end
end
