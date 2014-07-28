class Api::V1::CardsController < ApplicationController
  respond_to :json
  before_action :has_access?, only: [:create]
  before_action :set_card, only: [:update, :show]

  def create
    @card = Card.new(card_params)

    if @card.save
      render json: @card
    else
      render json: @card.errors, status: :unprocessable_entity
    end
  end

  def update
    if @card.update(card_params)
        render json: @card, status: :ok, location: @card
    else
        render json: @card.errors, status: :unprocessable_entity
    end
  end

  def show
    render json: @card, status: :ok, location: @card
  end

  private
  def set_card
    @card = current_user.cards.find(params[:id])
  end


  def has_access?
    current_user.lists.find(card_params[:list_id])
  end

  def card_params
    params.require(:card).permit(:id, :title, :position, :list_id)
  end
end
