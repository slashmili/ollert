class Api::V1::CardsController < ApplicationController
  respond_to :json
  before_action :has_access?, only: [:create]

  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  private

  def has_access?
    current_user.lists.find(card_params[:list_id])
  end

  def card_params
    params.require(:card).permit(:title, :list_id)
  end
end
